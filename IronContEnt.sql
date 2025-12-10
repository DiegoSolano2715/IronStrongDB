USE IronStrongFitness;
GO

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

select * from Clases;

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
