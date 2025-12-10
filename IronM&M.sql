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
