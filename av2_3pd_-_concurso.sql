-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/06/2026 às 22:43
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `av2 3pd - concurso`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `candidato`
--

CREATE TABLE `candidato` (
  `id_candidato` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `candidato`
--

INSERT INTO `candidato` (`id_candidato`, `nome`, `email`, `cpf`, `login`, `senha`, `endereco`) VALUES
(1, 'Gabriel Barbosa', 'gabigol@email.com', '111.111.111-11', 'gabigol', 'senha2019', 'Maracanã, 500, Rio de Janeiro'),
(5, 'Arrascaeta Mengo', 'arrascaeta@email.com', '222.222.222-22', 'arrasca', 'senha2022', 'Rua B, 200, Niterói'),
(6, 'Bruno Henrique', 'bh27@email.com', '333.333.333-33', 'bh27', 'senha2025', 'Rua C, 300, São Gonçalo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `id_concurso` int(11) NOT NULL,
  `nome_cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `id_concurso`, `nome_cargo`) VALUES
(1, 1, 'Analista Administrativo'),
(2, 1, 'Técnico de TI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `concurso`
--

CREATE TABLE `concurso` (
  `id_concurso` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `concurso`
--

INSERT INTO `concurso` (`id_concurso`, `nome`, `tipo`) VALUES
(1, 'Concurso Prefeitura Rio', 'Municipal'),
(2, 'Concurso Governo RJ', 'Estadual');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fiscal`
--

CREATE TABLE `fiscal` (
  `id_fiscal` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fiscal`
--

INSERT INTO `fiscal` (`id_fiscal`, `nome`) VALUES
(1, 'Ana Lima'),
(2, 'Pedro Costa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id_inscricao` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `status_inscricao` varchar(50) NOT NULL,
  `nota` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inscricao`
--

INSERT INTO `inscricao` (`id_inscricao`, `id_candidato`, `id_cargo`, `id_sala`, `status_inscricao`, `nota`) VALUES
(1, 1, 1, 1, 'Confirmada', 71.43),
(5, 6, 1, 1, 'Confirmada', 28.57),
(6, 5, 1, 2, 'Confirmada', 71.43);

-- --------------------------------------------------------

--
-- Estrutura para tabela `prova`
--

CREATE TABLE `prova` (
  `id_prova` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `peso` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `prova`
--

INSERT INTO `prova` (`id_prova`, `id_cargo`, `materia`, `peso`) VALUES
(1, 1, 'Português', 2.00),
(2, 1, 'Matemática', 3.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `questao`
--

CREATE TABLE `questao` (
  `id_questao` int(11) NOT NULL,
  `id_prova` int(11) NOT NULL,
  `instrucoes` text NOT NULL,
  `opcoes_resposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `questao`
--

INSERT INTO `questao` (`id_questao`, `id_prova`, `instrucoes`, `opcoes_resposta`) VALUES
(1, 1, 'Qual a função do sujeito na oração?', 'A)Predicado B)Sujeito C)Objeto D)Adjunto'),
(2, 1, 'Identifique o uso correto da crase.', 'A)À B)A C)Ah D)Há'),
(3, 2, 'Quanto é 2 elevado a 8?', 'A)128 B)256 C)512 D)64');

-- --------------------------------------------------------

--
-- Estrutura para tabela `recurso`
--

CREATE TABLE `recurso` (
  `id_recurso` int(11) NOT NULL,
  `id_inscricao` int(11) NOT NULL,
  `id_questao` int(11) NOT NULL,
  `justificativa` text NOT NULL,
  `status_recurso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recurso`
--

INSERT INTO `recurso` (`id_recurso`, `id_inscricao`, `id_questao`, `justificativa`, `status_recurso`) VALUES
(1, 1, 3, 'A questão está ambígua pois aceita mais de uma resposta correta.', 'Deferido');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resposta_candidato`
--

CREATE TABLE `resposta_candidato` (
  `id_inscricao` int(11) NOT NULL,
  `id_questao` int(11) NOT NULL,
  `opcao_marcada` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `resposta_candidato`
--

INSERT INTO `resposta_candidato` (`id_inscricao`, `id_questao`, `opcao_marcada`) VALUES
(1, 1, 'B'),
(1, 2, 'A'),
(1, 3, 'B'),
(5, 1, 'B'),
(5, 2, 'A'),
(5, 3, 'C'),
(6, 1, 'B'),
(6, 2, 'A'),
(6, 3, 'B');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `id_fiscal` int(11) NOT NULL,
  `numero_sala` int(11) NOT NULL,
  `nome_escola` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `id_fiscal`, `numero_sala`, `nome_escola`, `endereco`) VALUES
(1, 1, 101, 'Escola Estadual Rio', 'Av. Principal, 1000, Rio de Janeiro'),
(2, 2, 202, 'Colégio Central', 'Rua das Flores, 500, Niterói');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id_candidato`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices de tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `id_concurso` (`id_concurso`);

--
-- Índices de tabela `concurso`
--
ALTER TABLE `concurso`
  ADD PRIMARY KEY (`id_concurso`);

--
-- Índices de tabela `fiscal`
--
ALTER TABLE `fiscal`
  ADD PRIMARY KEY (`id_fiscal`);

--
-- Índices de tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id_inscricao`),
  ADD KEY `id_candidato` (`id_candidato`),
  ADD KEY `id_cargo` (`id_cargo`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Índices de tabela `prova`
--
ALTER TABLE `prova`
  ADD PRIMARY KEY (`id_prova`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Índices de tabela `questao`
--
ALTER TABLE `questao`
  ADD PRIMARY KEY (`id_questao`),
  ADD KEY `id_prova` (`id_prova`);

--
-- Índices de tabela `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id_recurso`),
  ADD KEY `id_inscricao` (`id_inscricao`),
  ADD KEY `id_questao` (`id_questao`);

--
-- Índices de tabela `resposta_candidato`
--
ALTER TABLE `resposta_candidato`
  ADD PRIMARY KEY (`id_inscricao`,`id_questao`),
  ADD KEY `id_questao` (`id_questao`);

--
-- Índices de tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `id_fiscal` (`id_fiscal`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `candidato`
--
ALTER TABLE `candidato`
  MODIFY `id_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `concurso`
--
ALTER TABLE `concurso`
  MODIFY `id_concurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fiscal`
--
ALTER TABLE `fiscal`
  MODIFY `id_fiscal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id_inscricao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `prova`
--
ALTER TABLE `prova`
  MODIFY `id_prova` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `questao`
--
ALTER TABLE `questao`
  MODIFY `id_questao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`id_concurso`) REFERENCES `concurso` (`id_concurso`);

--
-- Restrições para tabelas `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),
  ADD CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `inscricao_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`);

--
-- Restrições para tabelas `prova`
--
ALTER TABLE `prova`
  ADD CONSTRAINT `prova_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);

--
-- Restrições para tabelas `questao`
--
ALTER TABLE `questao`
  ADD CONSTRAINT `questao_ibfk_1` FOREIGN KEY (`id_prova`) REFERENCES `prova` (`id_prova`);

--
-- Restrições para tabelas `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `recurso_ibfk_1` FOREIGN KEY (`id_inscricao`) REFERENCES `inscricao` (`id_inscricao`),
  ADD CONSTRAINT `recurso_ibfk_2` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`);

--
-- Restrições para tabelas `resposta_candidato`
--
ALTER TABLE `resposta_candidato`
  ADD CONSTRAINT `resposta_candidato_ibfk_1` FOREIGN KEY (`id_inscricao`) REFERENCES `inscricao` (`id_inscricao`),
  ADD CONSTRAINT `resposta_candidato_ibfk_2` FOREIGN KEY (`id_questao`) REFERENCES `questao` (`id_questao`);

--
-- Restrições para tabelas `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_fiscal`) REFERENCES `fiscal` (`id_fiscal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
