CREATE DATABASE IronStrongFitness;
GO
USE IronStrongFitness;
GO

-- 1. Miembros
CREATE TABLE Miembros (
    IdMiembro INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    FechaNacimiento DATE,
    Email VARCHAR(100),
    Estado VARCHAR(20) -- Activo / Inactivo
);

INSERT INTO Miembros (Nombre, FechaNacimiento, Email, Estado)
VALUES
('Juan Pérez', '1990-05-10', 'juan@.com', 'Activo'),
('Ana Torres', '1985-03-20', 'ana@.com', 'Activo'),
('Carlos Ruiz', '1993-07-15', 'carlos@.com', 'Activo'),
('Luis Gómez', '1999-09-12', 'luis@.com', 'Activo'),
('Marta Díaz', '1988-11-23', 'marta@.com', 'inactivo'),
('Laura Silva', '1992-04-18', 'laura@.com', 'Activo'),
('Pedro Meneses', '1995-01-30', 'pedro@.com', 'Activo'),
('Daniel Ríos', '1991-02-14', 'daniel@.com', 'Activo'),
('Paola Castro', '2000-08-08', 'paola@.com', 'Activo'),
('Nancy Vega', '1984-10-05', 'nancy@.com', 'inactivo'),
('Mario Ortiz', '1997-12-12', 'mario@.com', 'Activo'),
('Adriana León', '1991-06-06', 'adriana@.com', 'Activo'),
('Félix Lora', '1994-04-09', 'felix@.com', 'Activo'),
('Julia Salas', '1993-02-22', 'julia@.com', 'Activo'),
('Oscar Peña', '1989-01-11', 'oscar@.com', 'inactivo'),
('Liliana Cruz', '1996-03-03', 'liliana@.com', 'Activo'),
('Diego Palma', '1990-07-19', 'diego@.com', 'Activo'),
('Sofía Lara', '1992-10-28', 'sofia@.com', 'Inactivo'),
('German Soto', '1987-09-15', 'german@.com', 'Activo'),
('Verónica Díaz', '1998-12-24', 'veronica@.com', 'Activo');

select * from Miembros;

-- 2. Membresias
CREATE TABLE Membresias (
    IdMembresia INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50),
    Costo DECIMAL(10,2),
    DuracionDias INT
);

INSERT INTO Membresias (Nombre, Costo, DuracionDias) VALUES
('Mensual', 30, 30),
('Trimestral', 80, 90),
('Semestral', 150, 180),
('Anual', 250, 365),
('VIP', 400, 365);

select * from Membresias;

-- 3. Contratos
CREATE TABLE Contratos (
    IdContrato INT IDENTITY PRIMARY KEY,
    IdMiembro INT,
    IdMembresia INT,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (IdMiembro) REFERENCES Miembros(IdMiembro),
    FOREIGN KEY (IdMembresia) REFERENCES Membresias(IdMembresia)
);

INSERT INTO Contratos (IdMiembro, IdMembresia, FechaInicio, FechaFin)
VALUES (1, 5, '2025-01-01', '2025-12-31');
INSERT INTO Contratos (IdMiembro, IdMembresia, FechaInicio, FechaFin)
VALUES (2, 1, '2024-01-01', '2024-12-31');  

-- No insertamos pagos para este contrato


select * from Contratos;

-- 4. Entrenadores
CREATE TABLE Entrenadores (
    IdEntrenador INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100)
);

INSERT INTO Entrenadores (Nombre, Especialidad) VALUES
('Carlos Martínez', 'Crossfit'),
('Ana López', 'Yoga'),
('Pedro Ramos', 'Funcional'),
('Andrea Soto', 'Pilates'),
('Hugo Vargas', 'Spinning'),
('Cristina León', 'Boxeo'),
('Marco Pérez', 'HIIT'),
('Susana Díaz', 'Zumba'),
('Rafael Mora', 'Cardio'),
('Elena Núñez', 'Estiramiento');

select * from Entrenadores;

-- 5. Clases
CREATE TABLE Clases (
    IdClase INT IDENTITY PRIMARY KEY,
    NombreClase VARCHAR(100),
    IdEntrenador INT,
    Horario DATETIME,
    CupoMaximo INT,
    FOREIGN KEY (IdEntrenador) REFERENCES Entrenadores(IdEntrenador)


);

select * from Clases;

INSERT INTO Clases (NombreClase, IdEntrenador, Horario, CupoMaximo) VALUES
('Crossfit Inicial', 1, '2025-01-10 08:00', 20),
('Crossfit Avanzado', 1, '2025-01-10 10:00', 15),
('Yoga Suave', 2, '2025-01-10 09:00', 25),
('Yoga Avanzado', 2, '2025-01-10 11:00', 20),
('Funcional Express', 3, '2025-01-10 07:00', 30),
('Pilates Básico', 4, '2025-01-10 12:00', 20),
('Pilates Suelo', 4, '2025-01-10 13:00', 20),
('Spinning Power', 5, '2025-01-10 18:00', 25),
('Boxeo Inicial', 6, '2025-01-10 17:00', 20),
('HIIT Infernal', 7, '2025-01-10 19:00', 25),
('Zumba Fit', 8, '2025-01-10 20:00', 30),
('Cardio Mix', 9, '2025-01-10 16:00', 30),
('Stretch Premium', 10, '2025-01-10 15:00', 25),
('Cardio Suave', 9, '2025-01-10 14:00', 20),
('HIIT Básico', 7, '2025-01-10 09:00', 20);


-- 6. Asistencias
CREATE TABLE Asistencias (
    IdAsistencia INT IDENTITY PRIMARY KEY,
    IdClase INT,
    IdMiembro INT,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IdClase) REFERENCES Clases(IdClase),
    FOREIGN KEY (IdMiembro) REFERENCES Miembros(IdMiembro)
);

INSERT INTO Asistencias (IdClase, IdMiembro) VALUES
(1,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),
(10,11),(11,12),(12,13),(13,14),(14,15),(15,16),(1,17),(2,18),
(3,19),(4,20),(5,1),(6,2),(7,3),(8,4),(9,5),(10,6),(11,7),(12,8),
(13,9),(14,10);

select * from Asistencias;


-- 7. Pagos
CREATE TABLE Pagos (
    IdPago INT IDENTITY PRIMARY KEY,
    IdContrato INT,
    Monto DECIMAL(10,2),
    FechaPago DATE,
    FOREIGN KEY (IdContrato) REFERENCES Contratos(IdContrato)
);

INSERT INTO Pagos (IdContrato, Monto, FechaPago) VALUES
(1, 50,  DATEADD(DAY, -2, GETDATE())),
(1, 60,  DATEADD(DAY, -10, GETDATE())),
(1, 70,  DATEADD(DAY, -15, GETDATE()));

select * from Pagos;

-- **********************************************************************
--    Consultas 
-- **********************************************************************

SELECT M.Nombre, ME.Nombre AS Membresia
FROM Miembros M
JOIN Contratos C ON M.IdMiembro = C.IdMiembro
JOIN Membresias ME ON C.IdMembresia = ME.IdMembresia
WHERE ME.Nombre = 'VIP';

-- **********************************************************************
SELECT C.NombreClase, E.Nombre AS Entrenador, C.Horario
FROM Clases C
JOIN Entrenadores E ON C.IdEntrenador = E.IdEntrenador
ORDER BY C.Horario, E.Nombre;

-- **********************************************************************
SELECT *
FROM Pagos
WHERE FechaPago >= DATEADD(MONTH, -1, GETDATE());

-- **********************************************************************
SELECT Email FROM Miembros
UNION
SELECT Nombre + '@entrenador.com' FROM Entrenadores;
-- **********************************************************************

SELECT IdMiembro
FROM Contratos
WHERE FechaFin >= GETDATE()

INTERSECT

SELECT IdMiembro
FROM Asistencias
WHERE FechaRegistro >= DATEADD(DAY, -7, GETDATE());

-- **********************************************************************

SELECT IdEntrenador
FROM Entrenadores

INTERSECT

SELECT IdEntrenador
FROM Clases;

-- **********************************************************************
BEGIN TRANSACTION;

DECLARE @Costo DECIMAL(10,2);
DECLARE @Pago DECIMAL(10,2) = 500;
DECLARE @Contrato INT = 1;

-- Obtener el costo de la membresía
SELECT @Costo = Me.Costo
FROM Contratos C
JOIN Membresias Me ON C.IdMembresia = Me.IdMembresia
WHERE C.IdContrato = @Contrato;

-- Validar pago primero
IF @Pago < @Costo
BEGIN
    RAISERROR('Pago insuficiente. Transacción cancelada.', 16, 1);
    ROLLBACK;
END
ELSE
BEGIN
    -- Insertar pago
    INSERT INTO Pagos (IdContrato, Monto, FechaPago)
    VALUES (@Contrato, @Pago, GETDATE());

    -- Actualizar contrato
    UPDATE Contratos
    SET FechaFin = DATEADD(DAY, 30, FechaFin)
    WHERE IdContrato = @Contrato;

    COMMIT;
END

SELECT *
FROM Pagos
ORDER BY FechaPago DESC;


-- **********************************************************************
CREATE PROCEDURE sp_InscribirClase
    @IdMiembro INT,
    @IdClase INT
AS
BEGIN
    DECLARE @Cupo INT;
    DECLARE @Inscritos INT;

    SELECT @Cupo = CupoMaximo FROM Clases WHERE IdClase = @IdClase;

    SELECT @Inscritos = COUNT(*) FROM Asistencias WHERE IdClase = @IdClase;

    IF @Inscritos >= @Cupo
    BEGIN
        RAISERROR('No hay cupos disponibles.', 16, 1);
        RETURN;
    END

    INSERT INTO Asistencias (IdClase, IdMiembro) VALUES (@IdClase, @IdMiembro);
END
GO

EXEC sp_InscribirClase @IdMiembro = 1, @IdClase = 1;

SELECT *
FROM Asistencias
WHERE IdClase = 1;

-- **********************************************************************

CREATE PROCEDURE sp_ReporteVentasEntrenador
    @IdEntrenador INT
AS
BEGIN
    SELECT E.Nombre AS Entrenador, SUM(P.Monto) AS TotalGenerado
    FROM Pagos P
    JOIN Contratos C ON P.IdContrato = C.IdContrato
    JOIN Clases CL ON C.IdMiembro = CL.IdClase
    JOIN Entrenadores E ON CL.IdEntrenador = E.IdEntrenador
    WHERE E.IdEntrenador = @IdEntrenador
    GROUP BY E.Nombre;
END;
GO


-- **********************************************************************
-- Funciones 
-- **********************************************************************
CREATE FUNCTION fn_EstadoMembresia (@FechaFin DATE)
RETURNS VARCHAR(20)
AS
BEGIN
    RETURN (CASE WHEN @FechaFin >= GETDATE() THEN 'VIGENTE' ELSE 'VENCIDA' END)
END
GO

SELECT C.IdContrato, C.FechaFin, dbo.fn_EstadoMembresia(C.FechaFin) AS EstadoMembresia
FROM Contratos C;

-- **********************************************************************
CREATE FUNCTION fn_EdadPromedioClase (@IdClase INT)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT AVG(DATEDIFF(YEAR, M.FechaNacimiento, GETDATE()))
        FROM Asistencias A
        JOIN Miembros M ON A.IdMiembro = M.IdMiembro
        WHERE A.IdClase = @IdClase
    );
END;
GO

SELECT C.IdClase, C.NombreClase, dbo.fn_EdadPromedioClase(C.IdClase) AS EdadPromedio
FROM Clases C;

-- **********************************************************************

CREATE VIEW vw_OcupacionGimnasio AS
SELECT C.NombreClase, E.Nombre AS Entrenador,
       C.CupoMaximo,
       COUNT(A.IdAsistencia) AS Inscritos
FROM Clases C
JOIN Entrenadores E ON C.IdEntrenador = E.IdEntrenador
LEFT JOIN Asistencias A ON C.IdClase = A.IdClase
GROUP BY C.NombreClase, E.Nombre, C.CupoMaximo;
GO

SELECT *
FROM vw_OcupacionGimnasio
ORDER BY Inscritos DESC;

-- **********************************************************************
CREATE VIEW vw_Deudores AS
SELECT M.Nombre, C.FechaFin
FROM Contratos C
JOIN Miembros M ON C.IdMiembro = M.IdMiembro
LEFT JOIN Pagos P ON P.IdContrato = C.IdContrato
WHERE C.FechaFin < GETDATE()
AND P.IdPago IS NULL;
GO

SELECT * FROM vw_Deudores;



-- **********************************************************************
--- Creacion de tabla para registar los pagos eliminados
-- **********************************************************************

CREATE TABLE LogPagosEliminados (
    IdPago INT,
    IdContrato INT,
    Monto DECIMAL(10,2),
    FechaPago DATE,
    Usuario VARCHAR(100),
    FechaEliminacion DATETIME
);

GO
-- **********************************************************************
--- creacion de Trigger 
-- **********************************************************************
CREATE TRIGGER trg_LogPagosDelete
ON Pagos
FOR DELETE
AS
BEGIN
    INSERT INTO LogPagosEliminados
    SELECT d.*, SYSTEM_USER, GETDATE()
    FROM deleted d;
END;
GO

-- Insertar un pago de prueba
INSERT INTO Pagos (IdContrato, Monto, FechaPago)
VALUES (1, 400, GETDATE());

-- Eliminarlo para disparar el trigger
DELETE FROM Pagos
WHERE IdPago = 1;

-- Ver lo que registró el trigger
SELECT * FROM LogPagosEliminados;

-- **********************************************************************
CREATE TRIGGER trg_ValidarMembresia
ON Asistencias
FOR INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Contratos C ON i.IdMiembro = C.IdMiembro
        WHERE C.FechaFin < GETDATE()
    )
    BEGIN
        ROLLBACK;
        RAISERROR('La membresía del miembro está vencida.', 16, 1);
    END
END;
GO

SELECT M.IdMiembro, M.Nombre, C.FechaFin
FROM Miembros M
JOIN Contratos C ON M.IdMiembro = C.IdMiembro
WHERE C.FechaFin < GETDATE();



-- **********************************************************************
-- CTE 
-- **********************************************************************
WITH ConteoClases AS (
    SELECT IdClase, COUNT(*) AS TotalAsistencias
    FROM Asistencias
    GROUP BY IdClase
)
SELECT TOP 3 *
FROM ConteoClases
ORDER BY TotalAsistencias DESC;
-- **********************************************************************