create database if not exists escola;
use escola;
create table if not exists responsavel_financeiro(
	id_responsavel_financeiro int primary key,
    nome varchar(50) not null,
    cpf char(14) not null unique key
);

create table if not exists turmas(
	id_turma int primary key,
    filial tinyint not null,
    turno char(1) not null
);

create table if not exists alunos(
	ra int primary key,
    nome varchar(50) not null,
    genero char(1),
    rua varchar(60) not null,
    bairro varchar(50) not null,
    cidade varchar(40) not null,
    numero varchar(10) not null,
    id_responsavel_financeiro int,
    id_turma int not null,
    constraint fk_responsavel_financeiro foreign key (id_responsavel_financeiro) references responsavel_financeiro(id_responsavel_financeiro),
    constraint fk_alunos_turma foreign key (id_turma) references turmas(id_turma)
);

create table if not exists professores(
	chapa varchar(8),
    nome varchar(50) not null,
    primary key(chapa)
);

create table if not exists especialidades(
	id_especialidade smallint primary key auto_increment,
    titulacao varchar(30) not null
);

#alter table responsavel_financeiro modify column id_responsavel_financeiro int auto_increment;

create table if not exists disciplina(
	id_turma int,
    id_professor varchar(8),
    sala char(3) not null,
    primary key(id_turma, id_professor),
    constraint fk_disciplina_turma foreign key (id_turma) references turmas(id_turma),
    constraint fk_disciplina_professor foreign key (id_professor) references professores(chapa)
);

create table if not exists professores_especialidades(
	professores_chapa varchar(8),
    id_especialidades smallint,
    primary key(professores_chapa,id_especialidades),
    foreign key (professores_chapa) references professores(chapa),
    foreign key (id_especialidades) references especialidades(id_especialidade)
);