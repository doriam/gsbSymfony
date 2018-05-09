<?php
namespace gsbComptableBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;
use \Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use gsbComptableBundle\Form\Type\FraisHorsForfaisType;
use gsbComptableBundle\Entity\Lignefraisforfait;
use gsbComptableBundle\Entity\Lignefraishorsforfait;
use gsbComptableBundle\Entity\Fichefrais;
use Symfony\Component\HttpFoundation\Request;

class ComptableController extends Controller {
    
    
    public function indexAction(){
        return $this->render('@gsbComptable/Comptable/comptableHome.html.twig');
    }
   
    public function getPeriode(){
        $dateCourante = new \DateTime('now');
        if($dateCourante->format('d') < 10){
            $dateCourante->sub(new \DateInterval('P1M'));
        }
        return $dateCourante;
    }
    
    public function getFicheFraisCourante($comptable, $date, $em){
        $ficheFrais = $em->getRepository('gsbComptableBundle:Fichefrais')
                      ->findOneBy(array('idvisiteur' => $comptable,
                                        'mois' => $date->format('m')));
      
        return $ficheFrais;
    }
    //Consulter les mois dans lesquels on trouve de fiches de frais à valider
    public function ConsulterFicheFraisAction(){
        $em = $this->getDoctrine()->getManager();
        $lesFichesDeFrais = $em->getRepository('gsbComptableBundle:Fichefrais')
                            ->findBy(array('idetat' => 'CR'));
        $lesMois = [];
        foreach($lesFichesDeFrais as $uneFicheFrais){
            $lesMois[$uneFicheFrais->getMois()] = $uneFicheFrais->getMois();
        }

        //Création du formulaire
        $formMois = $this->createFormBuilder()
                    ->add('periode', ChoiceType::class, 
                        array('choices' => $lesMois))
                    ->add('selectionner', SubmitType::class)
                    ->getForm();
                    $request = Request::createFromGlobals();
                    $formMois->handleRequest($request);

        //Condition - si le comptable clique sur selectionner
        if($formMois->isValid() && $formMois->isSubmitted()){

            $listeVisiteurs = $em->getRepository('gsbComptableBundle:Fichefrais')
                        ->findByLeMois($formMois->get('periode')->getData());
            $lesVisiteurs =[];
            foreach($listeVisiteurs as $unVisiteur){
            $lesVisiteurs[$unVisiteur->getIdVisiteur()->getNom()] = $unVisiteur->getIdVisiteur()->getNom();
            }
            //var_dump($listeVisiteurs);
            //print_r($formMois->get('periode')->getData());
            //print_r($lesVisiteurs);

            //Création du formulaire
            $formVisiteurs = $this->createFormBuilder()
                   ->add('visiteurs', ChoiceType::class, 
                        array('choices' => $lesVisiteurs))
                        
                    ->add('selectionner', SubmitType::class)
                    ->getForm();
                    $request = Request::createFromGlobals();
                    $formVisiteurs->handleRequest($request);

            return $this->render('@gsbComptable/Comptable/consulterVisiteur.html.twig', 
                    array(
                       'formVisiteurs' => $formVisiteurs->createView()
                        
                    ));
        }
        // ---- Fin de la condition 

        return $this->render('@gsbComptable/Comptable/consulterFicheFrais.html.twig', 
                array('formMois' => $formMois->createView()
            ));
    }

    public function ConsulLaFicheFrais(){
        
    }
}