<?php

namespace Range\FindOneClickBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * Range\FindOneClickBundle\Entity\Lieu
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="Range\FindOneClickBundle\Entity\LieuRepository")
 */
class Lieu
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
     * @var integer $Lat
     *
     * @ORM\Column(name="Lat", type="integer")
     */
    private $Lat;

    /**
     * @var integer $Lng
     *
     * @ORM\Column(name="Lng", type="integer")
     */
    private $Lng;

    /**
     * @var string $titre
     *
     * @ORM\Column(name="titre", type="string", length=255)
     */
    private $titre;


    /**
     * @gedmo:TreeParent
     * @ORM\ManyToOne(targetEntity="Lieu", inversedBy="parent")
     */
    private $parent;

    /**
     * @ORM\OneToMany(targetEntity="Lieu", mappedBy="children")
     */
    private $children;

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set Lat
     *
     * @param integer $lat
     */
    public function setLat($lat)
    {
        $this->Lat = $lat;
    }

    /**
     * Get Lat
     *
     * @return integer 
     */
    public function getLat()
    {
        return $this->Lat;
    }

    /**
     * Set Lng
     *
     * @param integer $lng
     */
    public function setLng($lng)
    {
        $this->Lng = $lng;
    }

    /**
     * Get Lng
     *
     * @return integer 
     */
    public function getLng()
    {
        return $this->Lng;
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
	 * Get parent 
	 * 
	 * @return Lieu
	 */
	public function getParent()
	{
		return $this->parent;
	}
	
	/**
	 * Set Parent 
	 * 
	 * @param Lieu $lieu
	 */
	public function setParent(Lieu $lieu)
	{
		$this->parent = $lieu;
	}
	
	public function __toString()
	{
		return $this->getTitre();
	}
}