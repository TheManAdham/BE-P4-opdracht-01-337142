<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
  
    <link rel="stylesheet" href="<?= URLROOT; ?>/css/style.css">
    <title>Overzicht Instructeurs</title>
</head>
<body>
    <u><?= $data['title']; ?></u>
    <div class="center-table">
        <table>
        <thead>
            <th>Naam Examen</th>
            <th>Datum Examen</th>
            <th>Rijbewijscategorie</th>
            <th>Rijschool</th>
            <th>Stad</th>
            <th>Uitslag Examen</th>
        </thead>
        <tbody>
            <?= $data['rows']; ?>
        </tbody>
    </table>
    </div>
</body>
</html>



