<?php

namespace Range\FindOneClickBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilder;

class LieuType extends AbstractType
{
    public function buildForm(FormBuilder $builder, array $options)
    {
        $builder
            ->add('Lat')
            ->add('Lng')
            ->add('titre')
            ->add('parent')
        ;
    }

    public function getName()
    {
        return 'range_findoneclickbundle_lieutype';
    }
}
