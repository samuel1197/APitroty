<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\TrajetRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass=TrajetRepository::class)
 */
class Trajet
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $start;

    /**
     * @ORM\Column(type="datetime")
     */
    private $finish;

    /**
     * @ORM\Column(type="integer")
     */
    private $time;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="trajets")
     * @ORM\JoinColumn(nullable=false)
     */
    private $username;


    /**
     * @ORM\Column(type="float")
     */
    private $cout;


    /**
     * @ORM\OneToOne(targetEntity=Evaluation::class, mappedBy="trajet", cascade={"persist", "remove"})
     */
    private $evall;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStart(): ?\DateTimeInterface
    {
        return $this->start;
    }

    public function setStart(\DateTimeInterface $start): self
    {
        $this->start = $start;

        return $this;
    }

    public function getFinish(): ?\DateTimeInterface
    {
        return $this->finish;
    }

    public function setFinish(\DateTimeInterface $finish): self
    {
        $this->finish = $finish;

        return $this;
    }

    public function getTime(): ?int
    {
        return $this->time;
    }

    public function setTime(int $time): self
    {
        $this->time = $time;

        return $this;
    }

    public function getUsername(): ?User
    {
        return $this->username;
    }

    public function setUsername(?User $username): self
    {
        $this->username = $username;

        return $this;
    }


    public function getCout(): ?float
    {
        return $this->cout;
    }

    public function setCout(float $cout): self
    {
        $this->cout = $cout;

        return $this;
    }


    public function getEvall(): ?Evaluation
    {
        return $this->evall;
    }

    public function setEvall(?Evaluation $evall): self
    {
        // unset the owning side of the relation if necessary
        if ($evall === null && $this->evall !== null) {
            $this->evall->setTrajet(null);
        }

        // set the owning side of the relation if necessary
        if ($evall !== null && $evall->getTrajet() !== $this) {
            $evall->setTrajet($this);
        }

        $this->evall = $evall;

        return $this;
    }
}
