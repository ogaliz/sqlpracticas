--  2019022805 paciente con enfermedades infecciosas
-- Están saliendo las enfermedades de las cuales están vacunadas, 
-- se debe pasar el NID del paciente!!
exec eHCSELSerologiaPaciente @paciente= 2020012372, @fecha = '' -- , @serologia = 41057

-- La forma correcta de hacerlo
-- eHCSELSerologiaPaciente @paciente= , @fecha =''
select top 1000 * from DEXPACIE order by PACIDX desc

DECLARE @paciente varchar(24)
SET @paciente = '2020012371'
DECLARE pacienteID CURSOR
    FOR select top 5 PACIDX from DEXPACIE order by PACIDX desc

	OPEN pacienteID
	FETCH NEXT FROM pacienteID INTO @paciente
	exec eHCSELSerologiaPaciente @paciente= @paciente, @fecha = ''
	WHILE @@FETCH_STATUS = 0
    BEGIN
       exec eHCSELSerologiaPaciente @paciente= @paciente, @fecha = ''--, @serologia = 41057;
       FETCH NEXT FROM pacienteID INTO 
           @paciente
    END;

	CLOSE pacienteID;
	deallocate pacienteID;


DECLARE @ReturnValue INT
EXEC @ReturnValue = eHCSELSerologiaPaciente @paciente= '', @fecha = ''
SELECT CONCAT(@ReturnValue, ' ', 'resultado') as pruebas