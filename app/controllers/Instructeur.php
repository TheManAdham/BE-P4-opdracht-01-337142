<?php

class Instructeur extends BaseController
{
    private $instructeurModel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('InstructeurModel');
    }

    public function overzichtInstructeur()
    {
        $result = $this->instructeurModel->getInstructeurs();

        //  var_dump($result);
        $aantalInstructeurs = sizeof($result);
        $rows = "";
        foreach ($result as $instructeur) {

            $date = date_create($instructeur->DatumInDienst);
            $formatted_date = date_format($date, 'd-m-Y');

            $rows .= "<tr>
                        <td>$instructeur->Voornaam</td>
                        <td>$instructeur->Tussenvoegsel</td>
                        <td>$instructeur->Achternaam</td>
                        <td>$instructeur->Mobiel</td>
                        <td>$formatted_date</td>            
                        <td>$instructeur->AantalSterren</td>            
                        <td>
                            <a href='" . URLROOT . "/instructeur/overzichtvoertuigen/?Id=$instructeur->Id'>
                                <i class='bi bi-car-front'></i>
                            </a>
                        </td>            
                      </tr>";

        }

        $data = [
            'title' => 'Instructeurs in dienst',
            'rows' => $rows,
            'aantalInstructeurs' => $aantalInstructeurs
        ];

        $this->view('Instructeur/overzichtinstructeur', $data);
    }

    public function overzichtVoertuigen()
    {

        if (isset($_GET['Id'])) {
            $Id = $_GET['Id'];
            $result = $this->instructeurModel->getToegewezenVoertuigen($Id);
        }
        //var_dump($result);
        $naam = $result[0]->full_name;
        $datum = $result[0]->DatumInDienst;
        $aantalSterren = $result[0]->AantalSterren;

        $tableRows = "";

        if (is_null($result[0]->TypeVoertuig)) {

            $tableRows = "<tr>
                            <td colspan='6'>
                                Er zijn op dit moment nog geen voertuigen toegewezen aan deze instructeur
                            </td>
                          </tr>";

        } else {
            foreach ($result as $voertuig) {

                $date_formatted = date_format(date_create($voertuig->Bouwjaar), 'd-m-Y');

                $tableRows .= "<tr>
                                    <td>$voertuig->TypeVoertuig</td>
                                    <td>$voertuig->Type</td>
                                    <td>$voertuig->Kenteken</td>
                                    <td>$date_formatted</td>
                                    <td>$voertuig->Brandstof</td>
                                    <td>$voertuig->Rijbewijscategorie</td>            
                            </tr>";

            }

        }

        $data = [
            'title'     => 'Door instructeur gebruikte voertuigen',
            'naam'      => $naam,
            'datum'      => $datum,
            'aantalSterren'   => $aantalSterren,
            'tableRows' => $tableRows
        ];

        $this->view('Instructeur/overzichtVoertuigen', $data);


    }
}
