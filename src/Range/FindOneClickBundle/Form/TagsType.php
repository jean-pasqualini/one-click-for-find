<?php

namespace Range\FindOneClickBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilder;

class TagsType extends AbstractType
{
    public function buildForm(FormBuilder $builder, array $options)
    {
        $builder
            ->add('nom')
        ;
    }

    public function getName()
    {
        return 'range_findoneclickbundle_tagstype';
    }
}
