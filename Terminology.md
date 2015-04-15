## Auxiliary terms and definitions ##
### Nucleic Acid Structure ###
#### Torsion Angles ####
The structural conformation of a nucleotide can be in part described by its torsion angles. The phosphodiester linkage (backbone) has six characteristic angles: α, β, γ, δ, ε, and ζ, the furanose has five torsions: θ<sub>0</sub> through θ<sub>4</sub>, and the glycosidic bond χ describes the remaining torsion angle (Figure 1).

![http://rnao.googlecode.com/svn/wiki/images/backboneangles.png](http://rnao.googlecode.com/svn/wiki/images/backboneangles.png)

**Figure 1** : RNA backbone with six torsion angles, the glycosidic torsion angle χ and the five torsion angles of the furanose (θ<sub>0</sub> through θ<sub>4</sub>).

Figure 1 depicts the δ and θ<sub>1</sub> torsions on the same covalent bond C3'-C4', but from different endpoints, respectively C2' and O4' for θ<sub>1</sub>, and C5' and O3' in the phosphodiester chain for δ. The glycosidic torsion, χ, is measured respectively in purines and pyrimidines from atoms 04'-C1'-N9-C4 and O4'-C1'-N1-C2.

The furanose ring stereochemistry imposes interdependent relations on θ<sub>0-4</sub>, which is expressed by the cosine function:

> θ<sub>j</sub> = θ<sub>max</sub>cos(ρ + jφ)            **(1)**
where j=0...4 and φ = 144°(720°/5).


When  j=0, we have:
> θ<sub>0</sub> = θ<sub>max</sub>cos(ρ)                 **(2)**

In equations 1 and 2, ρ is the pseudorotation of the ribose ring. Note that when ρ is varied from 0 to 360° by steps of 90°, θ<sub>0</sub> goes from θ<sub>max</sub> to 0, to -θ<sub>max</sub> to 0, and finally back to θ<sub>max</sub>. The θ<sub>max</sub> value is reached twice, at the initial conformation (ρ = 0, as cos(0) = 1) and at ρ = 360°. at each step of ρ + 180°, the sign of all torsions is inversed, corresponding to the mirror image of the conformation at ρ. Equation 1 can also be expressed in terms of ρ:

![http://rnao.googlecode.com/svn/wiki/images/equation3.png](http://rnao.googlecode.com/svn/wiki/images/equation3.png)

#### Base Normal Vectors ####
In pyrimidines the normal vector is the rotational vector η obtained by a right-handed rotation from atoms 1 to 6 around the pyrimidine ring. The pyrimidine ring in purines is reversed with respect to that of pyrimidines (Figure 2). The normal vector for any base can be defined by σ. Note that σ = η for cytosine and uracil, whereas σ = -η in adenine and guanine.

![http://rnao.googlecode.com/svn/wiki/images/normalVectors.png](http://rnao.googlecode.com/svn/wiki/images/normalVectors.png)

**Figure 2** : The normal vector η obtained from a right-handed rotation around the pyrimidine ring from atoms 1 to 6. In purines σ is defined as -η while in pyrimidines σ = η

---

### Ontological terms ###
#### Upper Level Classes ####
**Continuant**: An entity that exists in full at any time in which it exists at all, it persists through time while maintaining its identity and has no temporal parts.

**Independent Continuant**: A continuant that is the bearer of qualities and realizable entities. For example: a nucleic acid, a protein, a region of a cell.

**Dependent Continuant**: A continuant that is an attribute of the independent continuant that bears it. For example: the mass of a molecule, the functional role of a protein.

**Quality**: An intrinsic dependent continuant whose observed/measured value may change with time. For example: The mass of a molecule, the number of atoms in a protein.

**Fiat Object Part**: An independent continuant that is part of an object but is not demarcated by any physical discontinuities. For example: The part of the cell that is involved in cell adhesion.
#### Upper Level Relations ####
**hasPart** : A transitive relation such that one has as a part itself or another, with disconnected, overlapping or non-overlapping spatial regions. For example: Person has part arm, Workshop has part coffee break

**hasProperPart** : A mereological relation such that when x has proper part y, then x and y are distinct, and the spatial region occupied by y is wholly contained by with that of x. For example : car hasProperPart engine.

---

## Taxonomy of Terms ##

**Quality:
  * Conformation:**The quality of shape based on geometry**.
    * Nucleotide Conformation:**A conformation of the nucleotide based on the rotation of the base across the glycosidic torsion angle χ.*** Syn Conformation:**The syn conformation characterizes a nucleobase oriented towards the ribose. From χ = 0°, where the plane of the base is aligned with the O4’-C1’ bond in a direction towards the O4’ atom, the syn conformation covers the remaining rotations of ±90°: χ = [-90°, 90°]*******Anti Conformation****:**The anti conformation characterizes a base oriented away from the ribose. From χ = 180°, where the plane of the base is aligned with the O4’-C1’ bond in a direction away from O4’, the anti conformation covers a rotation of ±90°: χ = [-180°, -90°] and χ = [90°, 180°]*******Furanose Conformation:*********Pucker Conformation****:** A furanose conformation characterized by the set of their torsion angles: θ0-4.*******Envelope Conformation****:**A furanose conformation in which only one of the five furanose atoms  (C1’, C2’, C3’, C4’ or O4’) is out of the plane formed by the four others.
          * **<sup>3</sup>E conformation (C3’-endo)** : For ρ = [18°,36°[, the furanose forms an envelope with the C3’ atom above the plane.
          * **<sup>2</sup>E conformation (C2’-endo)** : The furanose forms an envelope with the C2' atom above the plane.
          * **<sub>4</sub>E conformation (C4' -exo)**: For ρ = [54°,72°[, the furanose forms an envelope with the C4' atom below the plane.
        * **Twist Conformation**: A furanose conformation in which two atoms are in opposite sides of the plane formed by the remaining three.*** <sup>3</sup>T<sub>2</sub> conformation (C3'-endo - C2'-exo):**At ρ = 0°, the furanose is in the twist shape with the C3’ atom above (endo) and the C2’atom below (exo) the plane*******<sup>3</sup>T<sub>4</sub> conformation (C3'-endo - C4' -exo)****:**For ρ = [36°,54°[, the furanose is in the twist conformation with C3' atom above (endo) and the C4' atom (exo), below the plane**.**


**Fiat Object Part:
  * Nucleotide Edge:**A [part](http://en.wikipedia.org/wiki/Mereology) of a nucleobase that is involved in edge-to-edge interactions such as base stacking and base pairing. (R = Purines and Y = Pyrimidines)*** Hoogsteen Edge / C-H Edge :**Edge composed by the following atoms:**1.**Adenine (Nitrogen 6) or Guanine (Oxygen 6)**1.**R (Nitrogen 7)**1.**Uracil (Oxygen 4) or Cytosine (Nitrogen 4)**1.**Y (Carbon 5), R (Carbon 8)*******Sugar Edge :**Edge composed by the following atoms:**1.**Adenine (Carbon 2) or Guanine (Nitrogen 2)**1.**R (Nitrogen 3)**1.**Y (Oxygen 2)**1.**Furanose (Oxygen 2)*******Watson Edge :**Edge composed by the following atoms:**1.**Adenine (Nitrogen 6) or Guanine (Oxygen 6)**1.**R (Nitrogen 1)**1.**Adenine (Carbon 2) or Guanine (Nitrogen 2)**1.**Uracil (Oxygen 4) or Cytosine**1.**(Nitrogen 4)**1.**Y (Nitrogen 3)**1.**Y (Oxygen 2)*******Nucleotide Face :**A proper part of a nucleotide edge that is capable of forming hydrogen bonds (R = Purines and Y = Pyrimidines)*******Bifurcated Face :**Face that represents the formation of a hydrogen bond that oscillates between two edges.*******Bifurcated Hoogsteen Face :**Face that is composed of the following atoms:**1.**Adenine (Nitrogen 6) or Guanine (Oxygen 6)**1.**Uracil (Oxygen 4) or Cytosine (Nitrogen 4)*******Bifurcated Sugar Face :**Face that is composed of the following atoms:**1.**Adenine (Carbon 2) or Guanine (Nitrogen 2)**1.**Y (Oxygen 2) *******Hoogsteen-Hoogsteen Face :**Face that is composed of the following atoms:**1.**R(Nitrogen 7)**1.**Y (Carbon 5)*******Hoogsteen-Watson Face :**Face that is composed of the follwing atoms:**1.**Adenine (Nitrogen 6) or Guanine (Oxygen 6)**1.**Uracil (Oxygen 4) or Cytosine (Nitrogen 4)*******Sugar-Sugar Face :**Face that is composed of the follwing atoms:**1.**R (Nitrogen 3)*******Sugar-Watson Face :**Face that is composed of the follwing atoms:**1.**Guanine (Nitrogen 2)**1.**Y (Oxygen 2) *******Watson-Hoogsteen Face :**Face that is composed of the follwing atoms:**1.**Adenine (Nitrogen 6) or Guanine (Oxygen 6)**1.**Uracil (Oxygen 4) or Cytosine (Nitrogen 4)*******Watson-Sugar Face :**Face that is composed of the follwing atoms:**1.**Guanine (Nitrogen 2)**1.**Y (Oxygen 2)*******Watson-Watson Face :**Face that is composed of the follwing atoms:**1.**R (Nitrogen 1)**1.**Y (Nitrogen 3) *******C8 Face :**Face that is composed of the follwing atom:**1.**R (Carbon 8)*******O2' Face :**Face that is composed of the follwing atom:**1.**Furanose O2'


**Role
  *****Atom Orientation in a Furanose Plane Role :**When considering a horizontal plane on the furanose composed of at least three of the ring atoms (C1’, C2’, C3’, C4’ or O4’), and the C5' is on the left side, the relative position of the ring atoms that exist outside of this plane determines their Furanose Plane Role*******Endo Role :**The atoms located over the plane are said to be endo to the C5'*******Exo Role :**The atoms located under the plane are said to be exo to the C5'*******Nucleotide Stacking Role :**Base stacking involves London dispersion inter-molecular interactions between two bases that induce a 3D arrangement where one base is stacked on top of the other. The normal vector σ to the plane each of the nitrogenous bases involved defines their Stacking Role. The following roles may be borne by stacked nitrogenous bases A and B:*******Facing Towards Role :**σ<sub>A</sub> has the same direction as σ<sub>B</sub>*******Facing Away Role :**σ<sub>A</sub> has an opposite direction to σ<sub>B</sub>

**Object
  * nitrogenous base {aka nucleobase or simply base}
    * purine
      * adenine
      * guanine
      * inosine
    * pyrimidine
      * cytosine
      * thymine
      * uracil
      * pseudouridine
  * ribose
  * phosphate
  * ribonucleoside: Composed of a ribose covalently linked to a base through a glycosidic bond.
    * purine nucleoside : Composed of a ribose covalently linked to a base through a C1’-N9 glycosidic bond.
      * adenosine
      * guanosine
    * pyrimidine nucleoside: Composed of a ribose covalently linked to a base through a C1’-N1 glycosidic bond.
      * cytidine
      * uridine
  * ribonucleotide: Composed of a ribonucleoside covalently linked to a phosphate through through diester bonds: C5’-O5’ and C3’-O3’.
    * C\*P
    * G\*P
    * A\*P
    * U\*P
  * nucleic acid
    * ribonucleic acid** Interaction
  * Base Pairing
    * canonical base pair ({GC},{AU},{AT})
    * non-canonical base pair (base pair and not canonical base pair)
    * base normal oriented base pair
      * parallel base pair
      * antiparallel base pair
    * glycosyl-bond oriented base pair
      * cis base pair
      * trans base pair
  * Base Stacking
    * adjacent stacking
    * non-adjacent stacking
    * base-normal oriented stacking
      * upward stacking
      * downward stacking
      * inward stacking
      * outward stacking


Not yet placed: