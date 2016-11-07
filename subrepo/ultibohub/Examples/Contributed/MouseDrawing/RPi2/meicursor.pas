UNIT meicursor;

{ 03.jul.2016   MG
  Define a new cursorshape in mycursor,
  then try to load another cursorshape from a pnm ASCI file
  from the disk. The pnm file is ASCII with for lines header, and then
  R \n G \n B \n. To create the file use GIMP, make a 32x32 pixel picture and
  export it as ASCII pnm file. }

{$mode objfpc}{$H+}


INTERFACE
USES
Filesystem,
Fatfs,
sysutils;


VAR mycursor  : ARRAY[0..1023] OF LongWord = ($AFEBFBF8,
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFE7FAF6, 
$AFFAFEFD, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF94E7D7, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AF87E4D1, 
$AFC0F1E7, 
$AFF6FDFC, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AFB3EEE2, 
$AFF6FDFC, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AFB0DFD4, 
$AFF1E6E5, 
$AFFAE7E7, 
$AFFAE7E7, 
$AFFAE7E7, 
$AFFCF3F3, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AFA2A59A, 
$AFDC8B89, 
$AFE48787, 
$AFE48787, 
$AFECAAAA, 
$AFFAE7E7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFE27E7E, 
$AFF5D2D2, 
$AFFAE7E7, 
$AFFEFAFA, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5959, 
$AFE27E7E, 
$AFF1C0C0, 
$AFFDF6F6, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFEBA4A4, 
$AFF8DFDF, 
$AFFCF3F3, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDE6A6A, 
$AFEBA5A5, 
$AFFAE7E7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFE17B7B, 
$AFF5D2D2, 
$AFFAE7E7, 
$AFFCF3F3, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5858, 
$AFE27E7E, 
$AFECAAAA, 
$AFFAE7E7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD8F6F0, 
$AF5ADAC1, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFE27E7E, 
$AFF5D2D2, 
$AFFAE7E7, 
$AFFEFAFA, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD6F6EF, 
$AF5CDBC2, 
$AF3FD4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5959, 
$AFE27E7E, 
$AFF1C0C0, 
$AFFDF6F6, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFCFF4ED, 
$AF66DCC5, 
$AF46D6B9, 
$AF44D5B8, 
$AF44D4B7, 
$AF44D2B5, 
$AF43D0B3, 
$AF43D0B3, 
$AF41D2B5, 
$AF3FD4B6, 
$AF3FD4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF3ED4B6, 
$AF99796E, 
$AFCD4544, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFEBA4A4, 
$AFF8DFDF, 
$AFFAE7E7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFD2F4EE, 
$AF9DE9DA, 
$AF8BE5D3, 
$AF89E4D1, 
$AF86D8C5, 
$AF7FB7A4, 
$AF799E8B, 
$AF789A87, 
$AF779B88, 
$AF779B88, 
$AF769C89, 
$AF769C89, 
$AF769C89, 
$AF769C89, 
$AFA36F65, 
$AFCC4644, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDE6A6A, 
$AFE38383, 
$AFF4CFCF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFE7FAF6, 
$AFE1F8F4, 
$AFDEF8F2, 
$AFDCF5F0, 
$AFD6DCD7, 
$AFC79792, 
$AFBB615C, 
$AFBA5A53, 
$AFBB5751, 
$AFBD5650, 
$AFBF544F, 
$AFC1534D, 
$AFC1524D, 
$AFC1514D, 
$AFC1514D, 
$AFD04241, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFF0BCBC, 
$AFFAE7E7, 
$AFFCF3F3, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFBFFFD, 
$AFFAFFFD, 
$AFFAFDFC, 
$AFFAFAF9, 
$AFF3DDDC, 
$AFE19291, 
$AFD45353, 
$AFD14646, 
$AFD14241, 
$AFD24040, 
$AFD24040, 
$AFD33F3F, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFE07474, 
$AFECAAAA, 
$AFFAE7E7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFEFBFB, 
$AFF8E2E2, 
$AFEDAFAF, 
$AFE17D7D, 
$AFD85252, 
$AFD44141, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFE07474, 
$AFF0BCBC, 
$AFF4CFCF, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFBFB, 
$AFFCEFEF, 
$AFF6D9D9, 
$AFEDB0B0, 
$AFDE6969, 
$AFD74848, 
$AFD44141, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFFBFB, 
$AFFCF1F1, 
$AFF4CCCC, 
$AFE69292, 
$AFDC6161, 
$AFD54545, 
$AFD43F3F, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF5D7D7, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFF8F8, 
$AFF9E1E1, 
$AFF1BFBF, 
$AFE38585, 
$AFD95555, 
$AFD54545, 
$AFD44141, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFBFB, 
$AFFDF4F4, 
$AFF7DBDB, 
$AFECAFAF, 
$AFE28383, 
$AFDA5E5E, 
$AFD54444, 
$AFD43F3F, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFAFA, 
$AFFCEEEE, 
$AFF7DBDB, 
$AFF0BCBC, 
$AFE28282, 
$AFD75050, 
$AFD44343, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFFAFA, 
$AFFDF4F4, 
$AFF7DBDB, 
$AFECADAD, 
$AFE17C7C, 
$AFD85050, 
$AFD44040, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFBFB, 
$AFFCEFEF, 
$AFF6DBDB, 
$AFEEB4B4, 
$AFDC6666, 
$AFD64747, 
$AFD43F3F, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFFBFB, 
$AFFCF3F3, 
$AFF5D2D2, 
$AFE99B9B, 
$AFE07373, 
$AFD54343, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFBFB, 
$AFFBE9E9, 
$AFF8DBDB, 
$AFEDAFAF, 
$AFD74B4B, 
$AFD54040, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFFCFC, 
$AFFDF5F5, 
$AFF3CACA, 
$AFE38282, 
$AFDA5B5B, 
$AFD43F3F, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFAFA, 
$AFFAE4E4, 
$AFF4CACA, 
$AFE28080, 
$AFD54040, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFDFD, 
$AFFEFAFA, 
$AFF9E3E3, 
$AFEDACAC, 
$AFE38484, 
$AFDE6969, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFDFD, 
$AFFCF2F2, 
$AFF9E5E5, 
$AFF8DDDD, 
$AFEBA4A4, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFD43E3E, 
$AFDA5A5A, 
$AFF6D8D8, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFFFF, 
$AFFFFEFE, 
$AFFFFDFD, 
$AFFDF4F4, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF4CFCF, 
$AFF6D8D8);

PROCEDURE loadcursor( filename : string);

IMPLEMENTATION


PROCEDURE loadcursor( filename : string);


        CONST alpha = $AF000000;
              maxpixel = 1024;

        VAR ein : TEXT;
            zeile : string;
            lauf,i, i2 : integer;
            dummy : integer;
            wert : byte;
            longwert, pixel : longword;


        BEGIN
        writeln('Waiting for drive C:\');
        while not DirectoryExists('C:\') do
         begin
          {Sleep for a second}
          Sleep(1000);
         end;
        writeln('C:\ drive is ready');


        {$I-}
        assign(EIN, filename);
        reset(EIN);
        {$I+}


        IF ioresult <> 0 THEN
                BEGIN
                writeln('ERROR unable to open cursor file :',filename);
                exit;
                END;
        writeln('Now try to load file ',filename ,' with the new cursor shape');
        i := 0;
        i2 := 0;
        WHILE i2 < maxpixel DO  // eof does'nt work so the pnm file must have 32x32 pixel !!

                BEGIN
                IF i <= 3 THEN

                        BEGIN
                        // ignore the header of the pnm file
                        readln(EIN, zeile);
                        inc(i);
                        END
                     ELSE
                        BEGIN
                        pixel := alpha;

                        FOR lauf := 2 DOWNTO 0 DO

                                BEGIN
                                readln(EIN, zeile);
                                val(zeile, wert, dummy);
        //                        writeln(lauf, ' wert : ', wert, ' ', hexbyte(wert),' dummy : ', dummy, ' Pixel ' , hexlongword(pixel));

                                longwert := 0;
                                longwert := wert;
                                longwert := longwert SHL (8*lauf);
                                pixel := pixel OR longwert;
        //                        writeln(lauf, ' wert : ', wert, ' longwert ', hexlongword(longwert),' ', hexbyte(wert),' dummy : ', dummy, ' Pixel ', hexlongword(pixel));

                                END;

                        IF i2 < maxpixel THEN mycursor[i2] := pixel;
//                        IF I2 > 1000 THEN writeln('I2 : ', i2, 'Pixel : ', pixel);
                        inc(i2);
                        i := i+3;
                        END;
                END;
        writeln('Now try to close the file...');
        sleep(100);
        close(EIN);
        sleep(100);
        writeln(' File : ',filename, ' closed');
        sleep(1000);

        END;



 END.
