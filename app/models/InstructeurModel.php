<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
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

    public function getToegewezenVoertuigen($Id)
    {
        $sql = "
            SELECT CONCAT(ins.Voornaam,' ', COALESCE(ins.Tussenvoegsel,''),' ', ins.Achternaam) as full_name, 
            ins.DatumInDienst, 
            ins.AantalSterren, 
            typeVoer.TypeVoertuig, 
            voer.Type, 
            voer.Kenteken, 
            voer.Bouwjaar, 
            voer.Brandstof,
            typeVoer.Rijbewijscategorie
            FROM instructeur ins
            left JOIN voertuiginstructeur voerin ON ins.Id = voerin.InstructeurId
            left JOIN voertuig voer ON voerin.VoertuigId = voer.Id
            left JOIN typevoertuig typeVoer ON voer.TypeVoertuigId = typeVoer.Id
            WHERE ins.id = $Id;
        ";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

}
