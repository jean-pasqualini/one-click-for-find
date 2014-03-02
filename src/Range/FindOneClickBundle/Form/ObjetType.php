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
            ->add('description', null, array(
                "required" => false
            ))
            ->add('date', 'date', array(
                "widget" => "single_text",
                'format' => 'dd/MM/yyyy',
                "attr" => array(
                    "data-role" => "date",
                    "data-inline" => "true",
                    "type" => "text"
                )
            ))
            //->add('photo', new DocumentType)
            ->add('parent')
			//->add('tags', 'collection', array('type' => new TagsType))
            ->add('tags', "tags_selector", array("attr" => array("data-native-menu" => "false")))
        ;
    }

    public function getName()
    {
        return 'range_findoneclickbundle_objettype';
    }
}
