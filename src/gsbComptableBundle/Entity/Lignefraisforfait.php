<?php

namespace gsbComptableBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Lignefraisforfait
 *
 * @ORM\Table(name="lignefraisforfait", indexes={@ORM\Index(name="IDX_146093DCD1E09AE6", columns={"idFicheFrais"}), @ORM\Index(name="IDX_146093DC4134ACE6", columns={"idFraisForfait"}), @ORM\Index(name="IDX_146093DC2637A9FC", columns={"idEtat"})})
 * @ORM\Entity
 */
class Lignefraisforfait
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="quantite", type="integer", nullable=true)
     */
    private $quantite;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateModif", type="date", nullable=true)
     */
    private $datemodif;

    /**
     * @var \Etat
     *
     * @ORM\ManyToOne(targetEntity="Etat")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idEtat", referencedColumnName="id")
     * })
     */
    private $idetat;

    /**
     * @var \Fraisforfait
     *
     * @ORM\ManyToOne(targetEntity="Fraisforfait")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idFraisForfait", referencedColumnName="id")
     * })
     */
    private $idfraisforfait;

    /**
     * @var \Fichefrais
     *
     * @ORM\ManyToOne(targetEntity="Fichefrais")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="idFicheFrais", referencedColumnName="id")
     * })
     */
    private $idfichefrais;



    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set quantite
     *
     * @param integer $quantite
     *
     * @return Lignefraisforfait
     */
    public function setQuantite($quantite)
    {
        $this->quantite = $quantite;

        return $this;
    }

    /**
     * Get quantite
     *
     * @return integer
     */
    public function getQuantite()
    {
        return $this->quantite;
    }

    /**
     * Set datemodif
     *
     * @param \DateTime $datemodif
     *
     * @return Lignefraisforfait
     */
    public function setDatemodif($datemodif)
    {
        $this->datemodif = $datemodif;

        return $this;
    }

    /**
     * Get datemodif
     *
     * @return \DateTime
     */
    public function getDatemodif()
    {
        return $this->datemodif;
    }

    /**
     * Set idetat
     *
     * @param \gsbComptableBundle\Entity\Etat $idetat
     *
     * @return Lignefraisforfait
     */
    public function setIdetat(\gsbComptableBundle\Entity\Etat $idetat = null)
    {
        $this->idetat = $idetat;

        return $this;
    }

    /**
     * Get idetat
     *
     * @return \gsbComptableBundle\Entity\Etat
     */
    public function getIdetat()
    {
        return $this->idetat;
    }

    /**
     * Set idfraisforfait
     *
     * @param \gsbComptableBundle\Entity\Fraisforfait $idfraisforfait
     *
     * @return Lignefraisforfait
     */
    public function setIdfraisforfait(\gsbComptableBundle\Entity\Fraisforfait $idfraisforfait = null)
    {
        $this->idfraisforfait = $idfraisforfait;

        return $this;
    }

    /**
     * Get idfraisforfait
     *
     * @return \gsbComptableBundle\Entity\Fraisforfait
     */
    public function getIdfraisforfait()
    {
        return $this->idfraisforfait;
    }

    /**
     * Set idfichefrais
     *
     * @param \gsbComptableBundle\Entity\Fichefrais $idfichefrais
     *
     * @return Lignefraisforfait
     */
    public function setIdfichefrais(\gsbComptableBundle\Entity\Fichefrais $idfichefrais = null)
    {
        $this->idfichefrais = $idfichefrais;

        return $this;
    }

    /**
     * Get idfichefrais
     *
     * @return \gsbComptableBundle\Entity\Fichefrais
     */
    public function getIdfichefrais()
    {
        return $this->idfichefrais;
    }
}
