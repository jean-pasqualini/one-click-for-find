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
    private $Lat = 0;

    /**
     * @var integer $Lng
     *
     * @ORM\Column(name="Lng", type="integer")
     */
    private $Lng = 0;

    /**
     * @var string $titre
     *
     * @ORM\Column(name="titre", type="string", length=255)
     */
    private $titre;

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
	
	public function __toString()
	{
		return $this->getTitre();
	}
}