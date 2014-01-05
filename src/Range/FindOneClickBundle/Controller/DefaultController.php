<?php

namespace Range\FindOneClickBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Range\FindOneClickBundle\Entity\Objet;

use Range\FindOneClickBundle\Form\ObjetType;

use Range\FindOneClickBundle\Entity\Tags;

use Range\FindOneClickBundle\Entity\Lieu;

use Range\FindOneClickBundle\Form\LieuType;

use Symfony\Component\Security\Core\SecurityContext;

use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    
    public function indexAction()
    {
    	$em = $this->getDoctrine()->getEntityManager();
		
		$objets = $em->getRepository("RangeFindOneClickBundle:Objet")->findAll();
		
        return $this->render('RangeFindOneClickBundle:Default:index.html.twig', array(
			"objets" => $objets
		));
    }
	
	public function getTagIdAction()
	{
		$retour = array();	
			
		$request = $this->getRequest();
		
		$world = $request->request->get("world");
		
		if(empty($world))
		{
			$retour["etat"] = false;
			$retour["message"] = "Aucun message";
			$retour["data"] = array();
			
			return new Response(json_encode($retour));
		}
		
		$em = $this->getDoctrine()->getEntityManager();
		
		$tag = $em->getRepository("RangeFindOneClickBundle:Tags")->findOneByNom($world);
		
		if(empty($tag))
		{
			$tag = new Tags();
			
			$tag->setNom($world);
			
			$em->persist($tag);
			
			$em->flush();
		}
		
		
		$retour["etat"] = true;
		$retour["data"] = array(
			"id" => $tag->getId()
		);
		
		return new Response(json_encode($retour));
	}

    public function testNotifAction()
    {
        return new Response("test");
    }
	
	public function addObjectAction()
	{
		$form = $this->createForm(new ObjetType(), new Objet());
		
		$request = $this->getRequest();
		
		if($request->getMethod() == "POST")
		{
			$form->bind($request);
			
			if($form->isValid())
			{
				$em = $this->getDoctrine()->getEntityManager();
				
				$objet = $form->getData();
				
				$em->persist($objet);
				
				//$em->persist($objet->getPhoto());
				
				foreach($objet->getTags() as $tag)
				{
					$em->persist($tag);
				}
								
				$em->flush();
				
				return $this->redirect($this->generateUrl("RangeFindOneClickBundle_homepage"));
			}
		}
		
		return $this->render("RangeFindOneClickBundle:Default:addObject.html.twig", array(
			"form" => $form->createView()
		));
	}

	public function addLocationAction()
	{
		$form = $this->createForm(new LieuType(), new Lieu());
		
		return $this->render("RangeFindOneClickBundle:Default:addLocation.html.twig",
		array(
			"form" => $form->createView()
		));
	}
	
	public function editObjectAction(Objet $objet)
	{
		$form = $this->createForm(new ObjetType(), $objet);
		$request = $this->getRequest();
		
		if($request->getMethod() == "POST")
		{
			$form->bind($request);
			
			if($form->isValid())
			{
				$objet = $form->getData();
				
				$em = $this->getDoctrine()->getEntityManager();
				
				$em->persist($objet);
				
				$em->flush();
			}
		}
		
		return $this->render("RangeFindOneClickBundle:Default:editObject.html.twig", array(
			"form" => $form->createView(),
			"objet" => $objet
		));
	}
	
	public function deleteObjectAction(Objet $objet)
	{
		return $this->render("RangeFindOneClickBundle:Default:deleteObject.html.twig",array(
			"objet" => $objet
		));
	}
	
	public function detailObjectAction(Objet $objet)
	{
		$em = $this->getDoctrine()->getManager();
		
		$index = $objet->getParent();
		
		$path = array();
		
		if(!empty($index))
		{
		    $path[] = $index;
		    
    		while($index = $index->getParent())
    		{
    			$path[] = $index;
    			
    			$analyse = $index->getParent();
    		}
		}
		
		$path = array_reverse($path);
		
		$repositoryObjet = $em->getRepository("RangeFindOneClickBundle:Lieu");
		
		return $this->render("RangeFindOneClickBundle:Default:detailObject.html.twig", array(
			"objet" => $objet,
			"path" => $path
		));
	}
	
	public function loginAction()
	{
		$request = $this->getRequest();
        $session = $request->getSession();

        // get the login error if there is one
        if ($request->attributes->has(SecurityContext::AUTHENTICATION_ERROR)) {
            $error = $request->attributes->get(SecurityContext::AUTHENTICATION_ERROR);
        } else {
            $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        }

        return $this->render('RangeFindOneClickBundle:Security:login.html.twig', array(
            // last username entered by the user
            'last_username' => $session->get(SecurityContext::LAST_USERNAME),
            'error'         => $error,
        ));
	}
	
	public function searchObjectAction()
	{
    	$em = $this->getDoctrine()->getEntityManager();
		
		$literalQuery = $this->getRequest()->request->get("literalQuery");		
		
		$objets = $em->getRepository("RangeFindOneClickBundle:Objet")->getByLiteralQuery($literalQuery);
		
		return $this->render('RangeFindOneClickBundle:Default:listobjet.html.twig', array(
			"objets" => $objets
		));
	}
}
