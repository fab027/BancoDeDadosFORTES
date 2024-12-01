# **Script SQL + Diagrama DER + Documentação Textual**

 :exclamation: O Trabalho foi feito em grupo em junção com as matérias de ( **Construção de Software para Web**, **Experiência e Interface com o Usuário** e **Design e Desenvolvimento de Banco de Dados I** ).
 - O Grupo consiste nas seguintes pessoas:
    1. Fabricio Nascimento
    2. Talita Canedo
    3. Daniel Caldas
    4. João Mululo
    5. Brenno Aleixo
  
:exclamation: O tema proposto para esse **trabalho** foi em relação a empresa "**Fortes Engenharia**", que apoia projetos sociais e gostaria de ter auxilio na divulgação de editais e gerenciamento desses projetos sociais, desde envio das notas ficais por parte dos projetos até a inscrição desses projetos sociais no banco de dados da Fortes.

# **Documentação do Sistema de Banco de Dados "Fortes Engenharia"**

O sistema gerencia ações sociais realizadas em parceria com a  empresa **Fortes Engenharia**, permitindo o controle de usuários, ações sociais, progresso, feedbacks e ideias contribuídas.

## **Estrutura Principal**
### **1. Usuários**
- Gerencia informações de pessoas que interagem com o sistema, categorizadas como:
  - **Admin**: Controle total do sistema e do site.
  - **Parceiro**: Gerencia as ações sociais, envia as notas fiscais e cadastra elas nos editais.
  - **Colaborador**: Fornece o feedback sobre as ações sociais, regulariza as notas fiscais, ou seja, é um fiscal geral.

### **2. Ações Sociais**
- Representa projetos realizados pela empresa, vinculados a categorias (ex.: Educação, Meio Ambiente), com:
  - Datas de início e término.
  - Responsáveis.
  - Status (ex.: planejada, concluída).

### **3. Progresso das Ações**
- Acompanha etapas das ações sociais, descrevendo:
  - Status atual (ex.: iniciado, finalizado).
  - Data do progresso.
  - Detalhes sobre o avanço realizado.
  - Edital cadastrado.

### **4. Feedbacks**
- Armazena:
  - Avaliações (notas de 1 a 5).
  - Comentários sobre as ações sociais.

### **5. Avaliações Globais**
- Consolida:
  - Média das avaliações das ações.
  - Número total de feedbacks recebidos.
  - Conclusões gerais sobre as ações sociais

### **6. Contribuições de Ideias**
- Permite que usuários enviem sugestões e melhorias para ações específicas não só em relação ao site mas em relação a outras ações sociais

---

## **Estrutura Auxiliar**
### **1. Tipos de Usuário**
- Define os perfis de acesso ao sistema: **admin**, **parceiro** e **colaborador**.

### **2. Status de Progresso**
- Gerencia os estados possíveis das ações sociais e seus avanços (ex.: planejada, em andamento, concluída).

### **3. Categorias de Ações**
- Classifica as ações em temas como **Educação** e **Meio Ambiente**.

---

