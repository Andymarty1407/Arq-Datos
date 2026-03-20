CREATE TABLE pacientes (
    id_paciente SERIAL,
    cedula VARCHAR(20),
    nombre_completo VARCHAR(100),
    fecha_nacimiento DATE,
    tipo_sangre VARCHAR(5),
    CONSTRAINT pk_pacientes PRIMARY KEY (id_paciente),
    CONSTRAINT uq_pacientes_cedula UNIQUE (cedula)
);

CREATE TABLE personal_medico (
    id_medico SERIAL,
    tarjeta_profesional VARCHAR(50),
    nombre VARCHAR(100),
    especialidad VARCHAR(50),
    CONSTRAINT pk_medico PRIMARY KEY (id_medico),
    CONSTRAINT uq_medico_tarjeta UNIQUE (tarjeta_profesional)
);

CREATE TABLE citas_medicas (
    id_cita SERIAL,
    id_paciente INT,
    id_medico INT,
    fecha_hora TIMESTAMP,
    motivo_consulta TEXT,
    CONSTRAINT pk_citas PRIMARY KEY (id_cita),
    CONSTRAINT fk_citas_paciente FOREIGN KEY (id_paciente) 
        REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT fk_citas_medico FOREIGN KEY (id_medico) 
        REFERENCES personal_medico(id_medico) ON DELETE SET NULL
);

CREATE TABLE historias_clinicas (
    id_historia SERIAL,
    id_cita INT,
    diagnostico TEXT,
    tratamiento TEXT,
    CONSTRAINT pk_historias PRIMARY KEY (id_historia),
    CONSTRAINT fk_historias_cita FOREIGN KEY (id_cita) 
        REFERENCES citas_medicas(id_cita) ON DELETE RESTRICT
);

CREATE TABLE monitoreo_signos (
    id_lectura SERIAL,
    id_paciente INT,
    frecuencia_cardiaca INT,
    temperatura DECIMAL,
    fecha_hora TIMESTAMP,
    CONSTRAINT pk_monitoreo PRIMARY KEY (id_lectura),
    CONSTRAINT fk_monitoreo_paciente FOREIGN KEY (id_paciente) 
        REFERENCES pacientes(id_paciente) ON DELETE CASCADE
);