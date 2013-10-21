<?php

namespace Range\FindOneClickBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

use Smc\Module\PhotoBundle\Entity\Document;

use Doctrine\Common\Collections\ArrayCollection;

/**
 * Range\FindOneClickBundle\Entity\Objet
 *
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
    private $description;

    /**
     * @var Document $photo
     *
     * @ORM\OneToOne(targetEntity="Smc\Module\PhotoBundle\Entity\Document")
     */
    private $photo;

    /**
     * @var string $location
     *
     * @ORM\ManyToOne(targetEntity="Lieu")
     */
    private $location;

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
	 * Constructeur
	 * 
	 * @return Objet instance d'objet
	 */
	public function __construct()
	{
		$this->date = new \DateTime();
		$this->tags = new ArrayCollection();
	}

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
     * Set location
     *
     * @param Lieu $location
     */
    public function setLocation(Lieu $location)
    {
        $this->location = $location;
    }

    /**
     * Get location
     *
     * @return Lieu
     */
    public function getLocation()
    {
        return $this->location;
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
	
	public function isTag()
	{
		return $this->tags;
	}
	
	public function __toString()
	{
		return $this->getTitre();
	}
}