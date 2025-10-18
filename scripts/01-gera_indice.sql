-- exemplo de geração de indice
ALTER TABLE `adventureworks`.`purchaseorderdetail_2` 

ADD INDEX `idx01` (`DueDate` ASC) VISIBLE;
