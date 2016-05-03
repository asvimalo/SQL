-- 1 Listan ska visa fullst�ndiga namnet, avd.namn, fr�n vilken planet, k�n, ras oh och rang.

use Manifest
go
select FName, EName, DateOfDeath, Age, Department, Rank, Planet, DeathCause
from tblCrew left outer join tblDepartment on tblCrew.DepartmentID = tblDepartment.DepartmentID
			 left outer join tblRank on tblCrew.RankID = tblRank.RankID
			 left outer join tblPlanet on tblCrew.PlanetID = tblPlanet.PlanetID
			 left outer join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID;

-- 2 Utav dem som har omkommit, visa namn, d�dsorsak och datumet.

use Manifest
go
select FName, EName, DateOfDeath, tblCrew.DeathCauseID, DeathCause
from tblCrew inner join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID;

-- 3 Alla d�da utav kaptens grad som tj�nar �ver 50000.

use Manifest
go
select * from tblRank where salary < 50000 and Rank <> 'Captain';

-- 4. Alla d�da fr�n en viss planet.

use manifest 
go
select FName, EName, DateOfDeath, tblPlanet.PlanetID, Planet
from tblCrew inner join tblPlanet on tblCrew.PlanetID = tblPlanet.PlanetID
where Planet = 'Atollon';


-- 5. Alla d�da med namn och mellan en viss datums till en annan datum.
use Manifest
go
select Fname, DateOfDeath from tblCrew
where DateOfDeath between '2050-02-02' and '2050-02-03';


-- 6. Visa antal av olika rang.
use manifest
go 
select count(*) Rank
from tblRank;

-- 7. Visa max l�nen p� den som har omkommit.

use Manifest 
go 
select MAX(Salary)
from tblRank;

-- 8. Gruppera alla baserat p� d�dsorsak.

use Manifest
go
select * from tblCrew 
inner join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID order by DeathCause;
 
-- 9. Vad �r genomsnittsl�nen p� bes�ttningen, levande och d�da.

use Manifest
go
select AVG(CrewID) from tblCrew;