<?php

namespace gsbComptableBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use gsbSymfony\gsbComptableBundle\Resources\Entity\VisiteurRepository;
use Symfony\Component\HttpFoundation\Request;


class DefaultController extends Controller
{
    /**
     * @Route("/")
     */
    public function indexAction()
    {
        //return $this->render('@gsbComptable/Default/index.html.twig');
            $form = $this->createFormBuilder()
                ->add('login', TextType::class)
                ->add('mdp', PasswordType::class,array('label' => 'Mot de passe'))
                ->add('Valider', SubmitType::class)
                ->getForm() ;

        $request = Request::createFromGlobals();
        
        $form->handleRequest($request);
        //$form->handleRequest($this->get('request'));
        
        if($form->isValid()) {
            $em = $this->getDoctrine()->getManager();			
            $comptable = $em->getRepository('gsbComptableBundle:Visiteur')
                        ->findOneBy(array(
                            'login'=>$form->get('login')->getData(),
                            'mdp'=>md5($form->get('mdp')->getData()), 
                            'comptable'=>1)
                                );
            $session = new Session();
			//$session->start();
            //$session = $request->getSession();
            //print_r($visiteur);
            if($comptable != null){
                $session->set('comptable',$comptable);
                $session->getFlashBag()->add('success','Vous êtes connecté');
                return $this->redirectToRoute('gsb_comptable_comptable');
            } else {
                // Si comptable
                // Votre code ici ....        
                     
            }
        }
        
        return $this->render(
            '@gsbComptable/Authentification/index.html.twig',
            array('form' => $form->createView())
            );
    }
    
    public function deconnexionAction(){
        $this->get('session')->remove('comptable');
        
        return $this->redirectToRoute('gsb_comptable_homepage');
    }
}
