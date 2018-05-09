<?php
namespace gsbComptableBundle\Form;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\FormEvent; 
use Symfony\Component\Form\FormEvents;

class FicheFraisType extends AbstractType {

    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('idlignefraisforfait','collection',array('type' => new LignefraisforfaitType()))
                ->add('idlignefraishorsforfait','collection',array(
                    'type' => new LignefraishorsforfaitType(),
                    
                    ))
                
                ->add('nbJustificatifs', 'integer')
                ->add('montantValide', 'money');   
        
    }
    
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'gsbComptableBundle\Entity\Fichefrais',
        ));
    }

    public function getName() {
        return'ficheFrais';
    }

}