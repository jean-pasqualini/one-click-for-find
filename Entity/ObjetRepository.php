<?php

namespace Range\FindOneClickBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * ObjetRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ObjetRepository extends EntityRepository
{
	
	public function getByLiteralQuery($literalquery)
	{
		$subject = $literalquery;
		
		$mois_francais = array(
			"janvier",
			"février",
			"mars",
			"avril",
			"mai",
			"juin",
			"juillet",
			"aôut",
			"septembre",
			"octobre",
			"novembre",
			"décembre"
		);
		
		$mois_anglais = array(
			"january",
			"february",
			"march",
			"april",
			"may",
			"june",
			"july",
			"august",
			"september",
			"october",
			"november",
			"december"
		);
		
		$regex_mois = "janvier|février|mars|avril|mai|juin|juillet|aôut|septembre|octobre|novembre|décembre";
		
		$regex_date = "[0-9]{2}/[0-9]{2}/[0-9]{2,4}|[0-9]{2} (".$regex_mois.") [0-9]{4}|(".$regex_mois.") [0-9]{4}|[0-9]{4}";
	
		$mot_not_tag = "le|la|les|un|une|des";
				
		$queryBuilder = $this->createQueryBuilder('o');
		
		if(preg_match("#(?<original>(du|de) (?<datedebut>".$regex_date.") (à|au|jusqu'a) (?<datefin>".$regex_date."))#i", $subject, $matches))
		{			
			$subject = str_replace($matches["original"], "", $subject);
		
			$date_debut = new \DateTime(str_replace($mois_francais, $mois_anglais, $matches["datedebut"]));
			
			$date_fin = new \DateTime(str_replace($mois_francais, $mois_anglais, $matches["datefin"]));
		
			$queryBuilder->where($queryBuilder->expr()->between("o.date", ":datedebut",":datefin"))
				->setParameter('datedebut', $date_debut)
				->setParameter('datefin', $date_fin);
		}
		elseif(1==2 && preg_match("#(?<original>à partir (du|de) (?<datedebut>".$regex_date."))#i", $subject, $matches))
		{
			$subject = str_replace($matches["original"], "", $subject);
					
			$date_debut = new \DateTime(str_replace($mois_francais, $mois_anglais, $matches["datedebut"]));
					
			echo "date ou commencer : ".$date_debut->format("d/m/Y")."<BR>";
		}
		elseif(preg_match("#(?<original>(du|de) (?<date>".$regex_date."))#i", $subject, $matches))
		{
			$subject = str_replace($matches["original"], "", $subject);
					
			$date = new \DateTime(str_replace($mois_francais, $mois_anglais, $matches["date"]));
				
			$queryBuilder->where($queryBuilder->expr()->eq("o.date", ":date"))
				->setParameter("date", $date);
		}
				
		$query = $queryBuilder->getQuery();
		
		return $query->getResult();
	}
}