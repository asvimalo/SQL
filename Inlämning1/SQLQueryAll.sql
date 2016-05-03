-- 1 Listan ska visa fullständiga namnet, avd.namn, från vilken planet, kön, ras oh och rang.

use Manifest
go
select FName, EName, DateOfDeath, Age, Department, Rank, Planet, DeathCause
from tblCrew left outer join tblDepartment on tblCrew.DepartmentID = tblDepartment.DepartmentID
			 left outer join tblRank on tblCrew.RankID = tblRank.RankID
			 left outer join tblPlanet on tblCrew.PlanetID = tblPlanet.PlanetID
			 left outer join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID;

-- 2 Utav dem som har omkommit, visa namn, dödsorsak och datumet.

use Manifest
go
select FName, EName, DateOfDeath, tblCrew.DeathCauseID, DeathCause
from tblCrew inner join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID;

-- 3 Alla döda utav kaptens grad som tjänar över 50000.

use Manifest
go
select * from tblRank where salary < 50000 and Rank <> 'Captain';

-- 4. Alla döda från en viss planet.

use manifest 
go
select FName, EName, DateOfDeath, tblPlanet.PlanetID, Planet
from tblCrew inner join tblPlanet on tblCrew.PlanetID = tblPlanet.PlanetID
where Planet = 'Atollon';


-- 5. Alla döda med namn och mellan en viss datums till en annan datum.
use Manifest
go
select Fname, DateOfDeath from tblCrew
where DateOfDeath between '2050-02-02' and '2050-02-03';


-- 6. Visa antal av olika rang.
use manifest
go 
select count(*) Rank
from tblRank;

-- 7. Visa max lönen på den som har omkommit.

use Manifest 
go 
select MAX(Salary)
from tblRank;

-- 8. Gruppera alla baserat på dödsorsak.

use Manifest
go
select * from tblCrew 
inner join tblDeathCause on tblCrew.DeathCauseID = tblDeathCause.DeathCauseID order by DeathCause;
 
-- 9. Vad är genomsnittslönen på besättningen, levande och döda.

use Manifest
go
select AVG(CrewID) from tblCrew;