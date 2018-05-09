<?php

namespace gsbComptableBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class LignefraishorsforfaitType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('libelle', 'text')
            ->add('date', 'date', array('data' => new \DateTime('now')))
            ->add('montant', 'money')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'gsbComptableBundle\Entity\Lignefraishorsforfait'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'acyg_gsbfraisbundle_lignefraishorsforfait';
    }
}
