<?php

class Examen extends BaseController
{
    private $examenModel;

    public function __construct()
    {
        $this->examenModel = $this->model('examenModel');
    }

    public function overzichtExamen()
    {
        $result = $this->examenModel->getoverzichtExamen();

        $rows = "";
        foreach ($result as $exam) {

            $date = date_create($exam->DatumExamen);
            $formatted_date = date_format($date, 'd-m-Y');

            $rows .= "<tr>
            <td>$exam->NaamExamen</td>
            <td>$formatted_date</td> 
            <td>$exam->Rijbewijscategorie</td>
            <td>$exam->Rijschool</td>
            <td>$exam->Stad</td>            
            <td>$exam->UitslagExamen</td>                      
          </tr>";

        }

        $data = [
            'title' => 'Overzicht Afgenomen Examen Examinator',
            'rows' => $rows,
        ];

        $this->view('Examen/overzichtExamen', $data);
    }
}