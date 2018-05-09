<?php
namespace gsbComptableBundle\Repository;

use Doctrine\ORM\EntityRepository;

class FichefraisRepository extends EntityRepository
{
	public function findByLeMois($mois)
        {
            $qb= $this->createQueryBuilder('p')
                ->leftJoin('p.idvisiteur', 'a')
                ->addSelect('a')
				->where('p.idetat = :etat')->setParameter('etat','CR')
                ->andWhere('p.mois = :mois')->setParameter('mois', $mois);
          return $qb->getQuery()->getResult();
        }
}