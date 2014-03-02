<?php

namespace Range\FindOneClickBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Doctrine\Common\Collections\ArrayCollection;

use Gedmo\Mapping\Annotation as Gedmo;

/**
 * Range\FindOneClickBundle\Entity\Objet
 * @Gedmo\Tree(type="nested")
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="Range\FindOneClickBundle\Entity\ObjetRepository")
 */
class Objet
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string $identifiant
     *
     * @ORM\Column(name="identifiant", type="string")
     */
    private $identifiant;

    /**
     * @var string $titre
     *
     * @ORM\Column(name="titre", type="string", length=255)
     */
    private $titre;

    /**
     * @var text $description
     *
     * @ORM\Column(name="description", type="text")
     */
    private $description = "";

    /**
     * @var Document $photo
     *
     * @ORM\OneToOne(targetEntity="Document")
     */
    private $photo;

    /**
     * @var date $date
     *
     * @ORM\Column(name="date", type="date")
     */
    private $date;

    /**
     * @var Tags $tags
     *
     * @ORM\ManyToMany(targetEntity="Tags")
     */
    private $tags;

    /**
     * @Gedmo\TreeLeft
     * @ORM\Column(name="lft", type="integer")
     */
    private $lft;

    /**
     * @Gedmo\TreeLevel
     * @ORM\Column(name="lvl", type="integer")
     */
    private $lvl;

    /**
     * @Gedmo\TreeRight
     * @ORM\Column(name="rgt", type="integer")
     */
    private $rgt;

    /**
     * @Gedmo\TreeRoot
     * @ORM\Column(name="root", type="integer", nullable=true)
     */
    private $root;

    /**
     * @Gedmo\TreeParent
     * @ORM\ManyToOne(targetEntity="Objet", inversedBy="children")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id", onDelete="CASCADE")
     */
    protected $parent;

    /**
     * @ORM\OneToMany(targetEntity="Objet", mappedBy="parent")
     * @ORM\OrderBy({"lft" = "ASC"})
     */
    private $children;

    /**
     * @ORM\ManyToMany(targetEntity="Objet")
     */
    private $linkedsObject;

    private $container = false;

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    public function setParent(Objet $parent = null)
    {
        $this->parent = $parent;
    }

    public function getParent()
    {
        return $this->parent;
    }

	/**
	 * Constructeur
	 * 
	 * @return Objet instance d'objet
	 */
	public function __construct()
	{
		$this->date = new \DateTime();
		$this->tags = new ArrayCollection();
        $this->linkedsObject = new ArrayCollection();
	}

    public function getLinkedsObject()
    {
        return $this->linkedsObject;
    }

    public function addLinkedObject(Objet $objet)
    {
        $this->linkedsObject[] = $objet;
    }

    public function removeLinkedObject(Objet $objet)
    {
        $this->linkedsObject->removeElement($objet);
    }

    /**
     * Set titre
     *
     * @param string $titre
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;
    }

    /**
     * Get titre
     *
     * @return string 
     */
    public function getTitre()
    {
        return $this->titre;
    }

	/**
	 * Set identifiant
	 * 
	 * @param string $identifiant
	 */
	public function setIdentifiant($identifiant)
	{
		$this->identifiant = $identifiant;
	}
	
	/**
	 * Get identifiant
	 * 
	 * @return string
	 */
	public function getIdentifiant()
	{
		return $this->identifiant;
	}

    /**
     * Set description
     *
     * @param text $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * Get description
     *
     * @return text 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set photo
     *
     * @param Document $photo
     */
    public function setPhoto(Document $photo)
    {
        $this->photo = $photo;
    }

    /**
     * Get photo
     *
     * @return Document 
     */
    public function getPhoto()
    {
        return $this->photo;
    }

    /**
     * Set date
     *
     * @param date $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * Get date
     *
     * @return date 
     */
    public function getDate()
    {
        return $this->date;
    }
	
	/**
	 * Get tags
	 * 
	 * @return ArrayCollection 
	 */
	public function getTags()
	{
		return $this->tags;
	}
	
	public function addTag(Tags $tag)
	{
		$this->tags[] = $tag;
	}

    public function setTags(array $tags)
    {
        $this->tags = new ArrayCollection($tags);
    }

    public function removeTag(Tags $tag)
    {
        $this->tags->removeElement($tag);
    }
	
	public function isTag()
	{
		return $this->tags;
	}
	
	public function __toString()
	{
		return $this->getTitre();
	}
}