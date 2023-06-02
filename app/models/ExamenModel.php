<?php

class ExamenModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function get()
    {
        $sql = "SELECT Id
                      ,Voornaam
                      ,Tussenvoegsel
                      ,Achternaam
                      ,Mobiel
                      ,DatumInDienst
                      ,AantalSterren
                FROM  Instructeur
                ORDER BY AantalSterren DESC";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getoverzichtExamen()
    {
        $sql = "
        SELECT CONCAT(e.Voornaam, ' ', e.Tussenvoegsel, ' ', e.Achternaam) AS `NaamExamen`,
        ex.Datum AS `DatumExamen`,
        ex.Rijbewijscategorie,
        ex.Rijschool,
        ex.Stad,
        ex.Uitslag AS `UitslagExamen`
        FROM ExamenPerExaminator epe
        JOIN Examen ex ON epe.ExamenId = ex.Id
        JOIN Examinator e ON epe.ExaminatorId = e.Id;
        ";
    
    $this->db->query($sql);
    return $this->db->resultSet();
    }
}

    


    
    

