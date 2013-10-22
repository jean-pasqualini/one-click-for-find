<?php

namespace Range\FindOneClickBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;


use Smc\Module\PhotoBundle\Entity\Document;
use Smc\Module\PhotoBundle\Form\DocumentType;


class ObjetType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        	->add('identifiant')
            ->add('titre')
            ->add('description')
            ->add('date')
            //->add('photo', new DocumentType)
            ->add('location')
			//->add('tags', 'collection', array('type' => new TagsType))
            ->add('tags', null, array("attr" => array("data-native-menu" => "false")))
        ;
    }

    public function getName()
    {
        return 'range_findoneclickbundle_objettype';
    }
}
