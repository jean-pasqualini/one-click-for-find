<?php

namespace Range\FindOneClickBundle\Form;

use Doctrine\Common\Persistence\ObjectManager;
use Range\FindOneClickBundle\Form\DataTransformer\TagsTransformer;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class TagSelectorType extends AbstractType
{
    /**
     * @var ObjectManager
     */
    private $om;

    public function __construct(ObjectManager $om)
    {
        $this->om = $om;
    }

    public function buildForm(FormBuilderInterface $buider, array $options)
    {
        $transformer = new TagsTransformer($this->om);

        $buider->addModelTransformer($transformer);
    }

    public function getParent()
    {
        return "text";
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'invalid_message' => 'The selected tags doesnt exist'
        ));
    }

    /**
     * Returns the name of this type.
     *
     * @return string The name of this type
     */
    public function getName()
    {
        return "tags_selector";
    }

}