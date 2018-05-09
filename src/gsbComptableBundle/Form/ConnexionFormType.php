<?php
namespace gsbComptableBundle\Form;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ConnexionFormType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder
                ->add('login', 'text')
                ->add('mdp', 'password', array('label'=>'Mot de passe'))
                ->add('valider', 'submit')
                ->add('annuler', 'reset');
    }
    
    public function setDefaultOptions(OptionsResolverInterface $resolver) {
        
    }

    public function getName() {
        return'connexion';
    }

}