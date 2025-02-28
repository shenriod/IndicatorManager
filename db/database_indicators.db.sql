BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "sdgs" (
	"sdg_id"	TEXT,
	"name"	TEXT NOT NULL,
	"description"	TEXT NOT NULL,
	"url"	TEXT NOT NULL,
	PRIMARY KEY("sdg_id")
);
CREATE TABLE IF NOT EXISTS "key_concepts" (
	"concept_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"definition"	TEXT NOT NULL,
	PRIMARY KEY("concept_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "packages" (
	"package_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"definition"	TEXT,
	PRIMARY KEY("package_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sectors" (
	"sector_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	PRIMARY KEY("sector_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "indicator_concepts" (
	"indicator_id"	INTEGER NOT NULL,
	"concept_id"	INTEGER NOT NULL,
	FOREIGN KEY("concept_id") REFERENCES "key_concepts"("concept_id"),
	FOREIGN KEY("indicator_id") REFERENCES "indicators"("indicator_id"),
	PRIMARY KEY("indicator_id","concept_id")
);
CREATE TABLE IF NOT EXISTS "indicator_packages" (
	"indicator_id"	INTEGER NOT NULL,
	"package_id"	INTEGER NOT NULL,
	FOREIGN KEY("package_id") REFERENCES "packages"("package_id"),
	FOREIGN KEY("indicator_id") REFERENCES "indicators"("indicator_id"),
	PRIMARY KEY("indicator_id","package_id")
);
CREATE TABLE IF NOT EXISTS "themes" (
	"theme_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"sector_id"	INTEGER,
	PRIMARY KEY("theme_id" AUTOINCREMENT),
	FOREIGN KEY("sector_id") REFERENCES "sectors"("sector_id")
);
CREATE TABLE IF NOT EXISTS "units" (
	"unit_id"	INTEGER,
	"unit_shortname"	TEXT NOT NULL,
	"unit_longname"	TEXT NOT NULL,
	PRIMARY KEY("unit_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sap_topics" (
	"topic_id"	INTEGER,
	"topic_name"	TEXT NOT NULL,
	"topic_cat"	TEXT NOT NULL,
	PRIMARY KEY("topic_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "indicator_saptopics" (
	"indicator_id"	INTEGER NOT NULL,
	"topic_id"	INTEGER NOT NULL,
	FOREIGN KEY("indicator_id") REFERENCES "indicators"("indicator_id"),
	PRIMARY KEY("indicator_id","topic_id"),
	FOREIGN KEY("topic_id") REFERENCES "sap_topics"("topic_id")
);
CREATE TABLE IF NOT EXISTS "indicators" (
	"indicator_id"	INTEGER,
	"theme_id"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"definition"	TEXT NOT NULL,
	"unit_of_measurement"	TEXT NOT NULL,
	"disaggregation"	TEXT NOT NULL,
	"data_collection_method"	TEXT NOT NULL,
	"underlying_theory_of_change"	TEXT NOT NULL,
	"sdg_id"	TEXT NOT NULL,
	"additional_info"	TEXT,
	"is_standard"	TEXT,
	"indicator_level"	TEXT,
	"responsible_unit"	INTEGER NOT NULL DEFAULT 6,
	PRIMARY KEY("indicator_id" AUTOINCREMENT),
	FOREIGN KEY("theme_id") REFERENCES "themes"("theme_id"),
	FOREIGN KEY("sdg_id") REFERENCES "sdgs"("sdg_id")
);
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1','No Poverty','End poverty in all its forms everywhere.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.1','No Poverty','By 2030, eradicate extreme poverty for all people everywhere, currently measured as people living on less than $1.25 a day.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.2','No Poverty','By 2030, reduce at least by half the proportion of men, women and children of all ages living in poverty in all its dimensions according to national definitions.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.3','No Poverty','Implement nationally appropriate social protection systems and measures for all, including floors, and by 2030 achieve substantial coverage of the poor and the vulnerable.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.4','No Poverty','By 2030, ensure that all men and women, in particular the poor and the vulnerable, have equal rights to economic resources, as well as access to basic services, ownership and control over land and other forms of property, inheritance, natural resources, appropriate new technology and financial services, including microfinance.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.5','No Poverty','By 2030, build the resilience of the poor and those in vulnerable situations and reduce their exposure and vulnerability to climate-related extreme events and other economic, social and environmental shocks and disasters.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.a','No Poverty','Ensure significant mobilization of resources from a variety of sources, including through enhanced development cooperation, in order to provide adequate and predictable means for developing countries, in particular least developed countries, to implement programmes and policies to end poverty in all its dimensions.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('1.b','No Poverty','Create sound policy frameworks at the national, regional and international levels, based on pro-poor and gender-sensitive development strategies, to support accelerated investment in poverty eradication actions.','https://sdgs.un.org/goals/goal1');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2','Zero Hunger','End hunger, achieve food security and improved nutrition and promote sustainable agriculture.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.1','Zero Hunger','By 2030, end hunger and ensure access by all people, in particular the poor and people in vulnerable situations, including infants, to safe, nutritious and sufficient food all year round.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.2','Zero Hunger','By 2030, end all forms of malnutrition, including achieving, by 2025, the internationally agreed targets on stunting and wasting in children under 5 years of age, and address the nutritional needs of adolescent girls, pregnant and lactating women and older persons.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.3','Zero Hunger','By 2030, double the agricultural productivity and incomes of small-scale food producers, in particular women, indigenous peoples, family farmers, pastoralists and fishers, including through secure and equal access to land, other productive resources and inputs, knowledge, financial services, markets and opportunities for value addition and non-farm employment.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.4','Zero Hunger','By 2030, ensure sustainable food production systems and implement resilient agricultural practices that increase productivity and production, that help maintain ecosystems, that strengthen capacity for adaptation to climate change, extreme weather, drought, flooding and other disasters and that progressively improve land and soil quality.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.5','Zero Hunger','By 2020, maintain the genetic diversity of seeds, cultivated plants and farmed and domesticated animals and their related wild species, including through soundly managed and diversified seed and plant banks at the national, regional and international levels, and promote access to and fair and equitable sharing of benefits arising from the utilization of genetic resources and associated traditional knowledge, as internationally agreed.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.a','Zero Hunger','Increase investment, including through enhanced international cooperation, in rural infrastructure, agricultural research and extension services, technology development and plant and livestock gene banks in order to enhance agricultural productive capacity in developing countries, in particular least developed countries.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.b','Zero Hunger','Correct and prevent trade restrictions and distortions in world agricultural markets, including through the parallel elimination of all forms of agricultural export subsidies and all export measures with equivalent effect, in accordance with the mandate of the Doha Development Round.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('2.c','Zero Hunger','Adopt measures to ensure the proper functioning of food commodity markets and their derivatives and facilitate timely access to market information, including on food reserves, in order to help limit extreme food price volatility.','https://sdgs.un.org/goals/goal2');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3','Good Health and Well-being','Ensure healthy lives and promote well-being for all at all ages.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.1','Good Health and Well-being','By 2030, reduce the global maternal mortality ratio to less than 70 per 100,000 live births.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.2','Good Health and Well-being','By 2030, end preventable deaths of newborns and children under 5 years of age, with all countries aiming to reduce neonatal mortality to at least as low as 12 per 1,000 live births and under-5 mortality to at least as low as 25 per 1,000 live births.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.3','Good Health and Well-being','By 2030, end the epidemics of AIDS, tuberculosis, malaria and neglected tropical diseases and combat hepatitis, water-borne diseases and other communicable diseases.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.4','Good Health and Well-being','By 2030, reduce by one third premature mortality from non-communicable diseases through prevention and treatment and promote mental health and well-being.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.5','Good Health and Well-being','Strengthen the prevention and treatment of substance abuse, including narcotic drug abuse and harmful use of alcohol.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.6','Good Health and Well-being','By 2020, halve the number of global deaths and injuries from road traffic accidents.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.7','Good Health and Well-being','By 2030, ensure universal access to sexual and reproductive health-care services, including for family planning, information and education, and the integration of reproductive health into national strategies and programmes.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.8','Good Health and Well-being','Achieve universal health coverage, including financial risk protection, access to quality essential health-care services and access to safe, effective, quality and affordable essential medicines and vaccines for all.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.9','Good Health and Well-being','By 2030, substantially reduce the number of deaths and illnesses from hazardous chemicals and air, water and soil pollution and contamination.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.a','Good Health and Well-being','Strengthen the implementation of the World Health Organization Framework Convention on Tobacco Control in all countries, as appropriate.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.b','Good Health and Well-being','Support the research and development of vaccines and medicines for the communicable and non-communicable diseases that primarily affect developing countries, provide access to affordable essential medicines and vaccines, in accordance with the Doha Declaration on the TRIPS Agreement and Public Health, which affirms the right of developing countries to use to the full the provisions in the Agreement on Trade-Related Aspects of Intellectual Property Rights regarding flexibilities to protect public health, and, in particular, provide access to medicines for all.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.c','Good Health and Well-being','Substantially increase health financing and the recruitment, development, training and retention of the health workforce in developing countries, especially in least developed countries and small island developing States.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('3.d','Good Health and Well-being','Strengthen the capacity of all countries, in particular developing countries, for early warning, risk reduction and management of national and global health risks.','https://sdgs.un.org/goals/goal3');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4','Quality Education','Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.1','Quality Education','By 2030, ensure that all girls and boys complete free, equitable and quality primary and secondary education leading to relevant and effective learning outcomes.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.2','Quality Education','By 2030, ensure that all girls and boys have access to quality early childhood development, care and pre-primary education so that they are ready for primary education.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.3','Quality Education','By 2030, ensure equal access for all women and men to affordable and quality technical, vocational and tertiary education, including university.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.4','Quality Education','By 2030, substantially increase the number of youth and adults who have relevant skills, including technical and vocational skills, for employment, decent jobs and entrepreneurship.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.5','Quality Education','By 2030, eliminate gender disparities in education and ensure equal access to all levels of education and vocational training for the vulnerable, including persons with disabilities, indigenous peoples and children in vulnerable situations.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.6','Quality Education','By 2030, ensure that all youth and a substantial proportion of adults, both men and women, achieve literacy and numeracy.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.7','Quality Education','By 2030, ensure that all learners acquire the knowledge and skills needed to promote sustainable development, including, among others, through education for sustainable development and sustainable lifestyles, human rights, gender equality, promotion of a culture of peace and non-violence, global citizenship and appreciation of cultural diversity and of culture’s contribution to sustainable development.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.a','Quality Education','Build and upgrade education facilities that are child, disability and gender sensitive and provide safe, non-violent, inclusive and effective learning environments for all.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.b','Quality Education','By 2020, substantially expand globally the number of scholarships available to developing countries, in particular least developed countries, small island developing States and African countries, for enrolment in higher education, including vocational training and information and communications technology, technical, engineering and scientific programmes, in developed countries and other developing countries.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('4.c','Quality Education','By 2030, substantially increase the supply of qualified teachers, including through international cooperation for teacher training in developing countries, especially least developed countries and small island developing States.','https://sdgs.un.org/goals/goal4');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5','Gender Equality','Achieve gender equality and empower all women and girls.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.1','Gender Equality','End all forms of discrimination against all women and girls everywhere.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.2','Gender Equality','Eliminate all forms of violence against all women and girls in the public and private spheres, including trafficking and sexual and other types of exploitation.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.3','Gender Equality','Eliminate all harmful practices, such as child, early and forced marriage and female genital mutilation.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.4','Gender Equality','Recognize and value unpaid care and domestic work through the provision of public services, infrastructure and social protection policies and the promotion of shared responsibility within the household and the family as nationally appropriate.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.5','Gender Equality','Ensure women’s full and effective participation and equal opportunities for leadership at all levels of decision-making in political, economic and public life.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.6','Gender Equality','Ensure universal access to sexual and reproductive health and reproductive rights as agreed in accordance with the Programme of Action of the International Conference on Population and Development and the Beijing Platform for Action and the outcome documents of their review conferences.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.a','Gender Equality','Undertake reforms to give women equal rights to economic resources, as well as access to ownership and control over land and other forms of property, financial services, inheritance and natural resources, in accordance with national laws.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.b','Gender Equality','Enhance the use of enabling technology, in particular information and communications technology, to promote the empowerment of women.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('5.c','Gender Equality','Adopt and strengthen sound policies and enforceable legislation for the promotion of gender equality and the empowerment of all women and girls at all levels.','https://sdgs.un.org/goals/goal5');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6','Clean Water and Sanitation','Ensure availability and sustainable management of water and sanitation for all.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.1','Clean Water and Sanitation','By 2030, achieve universal and equitable access to safe and affordable drinking water for all.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.2','Clean Water and Sanitation','By 2030, achieve access to adequate and equitable sanitation and hygiene for all and end open defecation, paying special attention to the needs of women and girls and those in vulnerable situations.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.3','Clean Water and Sanitation','By 2030, improve water quality by reducing pollution, eliminating dumping and minimizing release of hazardous chemicals and materials, halving the proportion of untreated wastewater and substantially increasing recycling and safe reuse globally.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.4','Clean Water and Sanitation','By 2030, substantially increase water-use efficiency across all sectors and ensure sustainable withdrawals and supply of freshwater to address water scarcity and substantially reduce the number of people suffering from water scarcity.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.5','Clean Water and Sanitation','By 2030, implement integrated water resources management at all levels, including through transboundary cooperation as appropriate.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.6','Clean Water and Sanitation','By 2020, protect and restore water-related ecosystems, including mountains, forests, wetlands, rivers, aquifers and lakes.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.a','Clean Water and Sanitation','By 2030, expand international cooperation and capacity-building support to developing countries in water- and sanitation-related activities and programmes, including water harvesting, desalination, water efficiency, wastewater treatment, recycling and reuse technologies.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('6.b','Clean Water and Sanitation','Support and strengthen the participation of local communities in improving water and sanitation management.','https://sdgs.un.org/goals/goal6');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7','Affordable and Clean Energy','Ensure access to affordable, reliable, sustainable and modern energy for all.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7.1','Affordable and Clean Energy','By 2030, ensure universal access to affordable, reliable and modern energy services.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7.2','Affordable and Clean Energy','By 2030, increase substantially the share of renewable energy in the global energy mix.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7.3','Affordable and Clean Energy','By 2030, double the global rate of improvement in energy efficiency.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7.a','Affordable and Clean Energy','By 2030, enhance international cooperation to facilitate access to clean energy research and technology, including renewable energy, energy efficiency and advanced and cleaner fossil-fuel technology, and promote investment in energy infrastructure and clean energy technology.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('7.b','Affordable and Clean Energy','By 2030, expand infrastructure and upgrade technology for supplying modern and sustainable energy services for all in developing countries, in particular least developed countries, small island developing States and landlocked developing countries, in accordance with their respective programmes of support.','https://sdgs.un.org/goals/goal7');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8','Decent Work and Economic Growth','Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.1','Decent Work and Economic Growth','Sustain per capita economic growth in accordance with national circumstances and, in particular, at least 7 per cent gross domestic product growth per annum in the least developed countries.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.2','Decent Work and Economic Growth','Achieve higher levels of economic productivity through diversification, technological upgrading and innovation, including through a focus on high-value added and labour-intensive sectors.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.3','Decent Work and Economic Growth','Promote development-oriented policies that support productive activities, decent job creation, entrepreneurship, creativity and innovation, and encourage the formalization and growth of micro-, small- and medium-sized enterprises, including through access to financial services.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.4','Decent Work and Economic Growth','Improve progressively, through 2030, global resource efficiency in consumption and production and endeavour to decouple economic growth from environmental degradation, in accordance with the 10-year framework of programmes on sustainable consumption and production, with developed countries taking the lead.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.5','Decent Work and Economic Growth','By 2030, achieve full and productive employment and decent work for all women and men, including for young people and persons with disabilities, and equal pay for work of equal value.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.6','Decent Work and Economic Growth','By 2020, substantially reduce the proportion of youth not in employment, education or training.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.7','Decent Work and Economic Growth','Take immediate and effective measures to eradicate forced labour, end modern slavery and human trafficking and secure the prohibition and elimination of the worst forms of child labour, including recruitment and use of child soldiers, and by 2025 end child labour in all its forms.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.8','Decent Work and Economic Growth','Protect labour rights and promote safe and secure working environments for all workers, including migrant workers, particularly women migrants, and those in precarious employment.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.9','Decent Work and Economic Growth','By 2030, devise and implement policies to promote sustainable tourism that creates jobs and promotes local culture and products.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.a','Decent Work and Economic Growth','Increase Aid for Trade support for developing countries, in particular least developed countries, including through the Enhanced Integrated Framework for Trade-Related Technical Assistance to Least Developed Countries.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('8.b','Decent Work and Economic Growth','By 2020, develop and operationalize a global strategy for youth employment and implement the Global Jobs Pact of the International Labour Organization.','https://sdgs.un.org/goals/goal8');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9','Industry, Innovation, and Infrastructure','Build resilient infrastructure, promote inclusive and sustainable industrialization, and foster innovation.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.1','Industry, Innovation, and Infrastructure','Develop quality, reliable, sustainable, and resilient infrastructure, including regional and transborder infrastructure, to support economic development and human well-being, with a focus on affordable and equitable access for all.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.2','Industry, Innovation, and Infrastructure','Promote inclusive and sustainable industrialization and, by 2030, significantly raise industry’s share of employment and gross domestic product, in line with national circumstances, and double its share in least developed countries.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.3','Industry, Innovation, and Infrastructure','Increase the access of small-scale industrial and other enterprises, in particular in developing countries, to financial services, including affordable credit, and their integration into value chains and markets.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.4','Industry, Innovation, and Infrastructure','By 2030, upgrade infrastructure and retrofit industries to make them sustainable, with increased resource-use efficiency and greater adoption of clean and environmentally sound technologies and industrial processes, with all countries taking action in accordance with their respective capabilities.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.5','Industry, Innovation, and Infrastructure','Enhance scientific research, upgrade the technological capabilities of industrial sectors in all countries, in particular developing countries, including, by 2030, encouraging innovation and substantially increasing the number of research and development workers per 1 million people and public and private research and development spending.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.a','Industry, Innovation, and Infrastructure','Facilitate sustainable and resilient infrastructure development in developing countries through enhanced financial, technological, and technical support to African countries, least developed countries, landlocked developing countries, and small island developing States.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.b','Industry, Innovation, and Infrastructure','Support domestic technology development, research, and innovation in developing countries, including by ensuring a conducive policy environment for, inter alia, industrial diversification and value addition to commodities.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('9.c','Industry, Innovation, and Infrastructure','Significantly increase access to information and communications technology and strive to provide universal and affordable access to the Internet in least developed countries by 2020.','https://sdgs.un.org/goals/goal9');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10','Reduced Inequalities','Reduce inequality within and among countries.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.1','Reduced Inequalities','By 2030, progressively achieve and sustain income growth of the bottom 40 per cent of the population at a rate higher than the national average.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.2','Reduced Inequalities','By 2030, empower and promote the social, economic, and political inclusion of all, irrespective of age, sex, disability, race, ethnicity, origin, religion, or economic or other status.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.3','Reduced Inequalities','Ensure equal opportunity and reduce inequalities of outcome, including by eliminating discriminatory laws, policies, and practices and promoting appropriate legislation, policies, and action in this regard.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.4','Reduced Inequalities','Adopt policies, especially fiscal, wage, and social protection policies, and progressively achieve greater equality.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.5','Reduced Inequalities','Improve the regulation and monitoring of global financial markets and institutions and strengthen the implementation of such regulations.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.6','Reduced Inequalities','Ensure enhanced representation and voice for developing countries in decision-making in global international economic and financial institutions in order to deliver more effective, credible, accountable, and legitimate institutions.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.7','Reduced Inequalities','Facilitate orderly, safe, regular, and responsible migration and mobility of people, including through the implementation of planned and well-managed migration policies.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.a','Reduced Inequalities','Implement the principle of special and differential treatment for developing countries, in particular least developed countries, in accordance with World Trade Organization agreements.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.b','Reduced Inequalities','Encourage official development assistance and financial flows, including foreign direct investment, to States where the need is greatest, in particular least developed countries, African countries, small island developing States, and landlocked developing countries, in accordance with their national plans and programmes.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('10.c','Reduced Inequalities','By 2030, reduce to less than 3 per cent the transaction costs of migrant remittances and eliminate remittance corridors with costs higher than 5 per cent.','https://sdgs.un.org/goals/goal10');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11','Sustainable Cities and Communities','Make cities and human settlements inclusive, safe, resilient, and sustainable.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.1','Sustainable Cities and Communities','By 2030, ensure access for all to adequate, safe, and affordable housing and basic services and upgrade slums.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.2','Sustainable Cities and Communities','By 2030, provide access to safe, affordable, accessible, and sustainable transport systems for all, improving road safety, notably by expanding public transport, with special attention to the needs of those in vulnerable situations, women, children, persons with disabilities, and older persons.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.3','Sustainable Cities and Communities','By 2030, enhance inclusive and sustainable urbanization and capacity for participatory, integrated, and sustainable human settlement planning and management in all countries.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.4','Sustainable Cities and Communities','Strengthen efforts to protect and safeguard the world’s cultural and natural heritage.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.5','Sustainable Cities and Communities','By 2030, significantly reduce the number of deaths and the number of people affected by disasters, including water-related disasters, with a focus on protecting the poor and people in vulnerable situations.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.6','Sustainable Cities and Communities','By 2030, reduce the adverse per capita environmental impact of cities, including by paying special attention to air quality and municipal and other waste management.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.7','Sustainable Cities and Communities','By 2030, provide universal access to safe, inclusive, and accessible, green and public spaces, in particular for women and children, older persons, and persons with disabilities.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.a','Sustainable Cities and Communities','Support positive economic, social, and environmental links between urban, peri-urban, and rural areas by strengthening national and regional development planning.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.b','Sustainable Cities and Communities','By 2020, substantially increase the number of cities and human settlements adopting and implementing integrated policies and plans towards inclusion, resource efficiency, mitigation and adaptation to climate change, resilience to disasters, and develop and implement, in line with the Sendai Framework for Disaster Risk Reduction 2015-2030, holistic disaster risk management at all levels.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('11.c','Sustainable Cities and Communities','Support least developed countries, including through financial and technical assistance, in building sustainable and resilient buildings utilizing local materials.','https://sdgs.un.org/goals/goal11');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12','Responsible Consumption and Production','Ensure sustainable consumption and production patterns.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.1','Responsible Consumption and Production','Implement the 10-year framework of programmes on sustainable consumption and production, all countries taking action, with developed countries taking the lead, taking into account the development and capabilities of developing countries.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.2','Responsible Consumption and Production','By 2030, achieve the sustainable management and efficient use of natural resources.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.3','Responsible Consumption and Production','By 2030, halve per capita global food waste at the retail and consumer levels and reduce food losses along production and supply chains, including post-harvest losses.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.4','Responsible Consumption and Production','By 2020, achieve the environmentally sound management of chemicals and all wastes throughout their life cycle, in accordance with agreed international frameworks, and significantly reduce their release to air, water, and soil in order to minimize their adverse impacts on human health and the environment.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.5','Responsible Consumption and Production','By 2030, substantially reduce waste generation through prevention, reduction, recycling, and reuse.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.6','Responsible Consumption and Production','Encourage companies, especially large and transnational companies, to adopt sustainable practices and integrate sustainability information into their reporting cycle.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.7','Responsible Consumption and Production','Promote public procurement practices that are sustainable, in accordance with national policies and priorities.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.8','Responsible Consumption and Production','By 2030, ensure that people everywhere have the relevant information and awareness for sustainable development and lifestyles in harmony with nature.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.a','Responsible Consumption and Production','Support developing countries to strengthen their scientific and technological capacity to move towards more sustainable patterns of consumption and production.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.b','Responsible Consumption and Production','Develop and implement tools to monitor sustainable development impacts for sustainable tourism that creates jobs and promotes local culture and products.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('12.c','Responsible Consumption and Production','Rationalize inefficient fossil-fuel subsidies that encourage wasteful consumption by removing market distortions, in accordance with national circumstances, including by restructuring taxation and phasing out those harmful subsidies, where they exist, to reflect their environmental impacts, taking fully into account the specific needs and conditions of developing countries and minimizing the possible adverse impacts on their development in a manner that protects the poor and the affected communities.','https://sdgs.un.org/goals/goal12');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13','Climate Action','Take urgent action to combat climate change and its impacts.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13.1','Climate Action','Strengthen resilience and adaptive capacity to climate-related hazards and natural disasters in all countries.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13.2','Climate Action','Integrate climate change measures into national policies, strategies, and planning.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13.3','Climate Action','Improve education, awareness-raising, and human and institutional capacity on climate change mitigation, adaptation, impact reduction, and early warning.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13.a','Climate Action','Implement the commitment undertaken by developed-country parties to the United Nations Framework Convention on Climate Change to a goal of mobilizing jointly $100 billion annually by 2020 from all sources to address the needs of developing countries in the context of meaningful mitigation actions and transparency on implementation, and fully operationalize the Green Climate Fund through its capitalization as soon as possible.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('13.b','Climate Action','Promote mechanisms for raising capacity for effective climate change-related planning and management in least developed countries and small island developing States, including focusing on women, youth, and local and marginalized communities.','https://sdgs.un.org/goals/goal13');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14','Life Below Water','Conserve and sustainably use the oceans, seas, and marine resources for sustainable development.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.1','Life Below Water','By 2025, prevent and significantly reduce marine pollution of all kinds, in particular from land-based activities, including marine debris and nutrient pollution.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.2','Life Below Water','By 2020, sustainably manage and protect marine and coastal ecosystems to avoid significant adverse impacts, including by strengthening their resilience, and take action for their restoration in order to achieve healthy and productive oceans.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.3','Life Below Water','Minimize and address the impacts of ocean acidification, including through enhanced scientific cooperation at all levels.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.4','Life Below Water','By 2020, effectively regulate harvesting and end overfishing, illegal, unreported, and unregulated fishing, and destructive fishing practices and implement science-based management plans, in order to restore fish stocks in the shortest time feasible, at least to levels that can produce maximum sustainable yield as determined by their biological characteristics.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.5','Life Below Water','By 2020, conserve at least 10 per cent of coastal and marine areas, consistent with national and international law and based on the best available scientific information.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.6','Life Below Water','By 2020, prohibit certain forms of fisheries subsidies which contribute to overcapacity and overfishing, eliminate subsidies that contribute to illegal, unreported, and unregulated fishing, and refrain from introducing new such subsidies, recognizing that appropriate and effective special and differential treatment for developing and least developed countries should be an integral part of the World Trade Organization fisheries subsidies negotiation.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.7','Life Below Water','By 2030, increase the economic benefits to small island developing States and least developed countries from the sustainable use of marine resources, including through sustainable management of fisheries, aquaculture, and tourism.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.a','Life Below Water','Increase scientific knowledge, develop research capacity, and transfer marine technology, in order to improve ocean health and to enhance the contribution of marine biodiversity to the development of developing countries, in particular small island developing States and least developed countries.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.b','Life Below Water','Provide access for small-scale artisanal fishers to marine resources and markets.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('14.c','Life Below Water','Enhance the conservation and sustainable use of oceans and their resources by implementing international law as reflected in UNCLOS, which provides the legal framework for the conservation and sustainable use of oceans and their resources, as recalled in paragraph 158 of The Future We Want.','https://sdgs.un.org/goals/goal14');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15','Life on Land','Protect, restore, and promote sustainable use of terrestrial ecosystems, sustainably manage forests, combat desertification, halt and reverse land degradation, and halt biodiversity loss.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.1','Life on Land','By 2020, ensure the conservation, restoration, and sustainable use of terrestrial and inland freshwater ecosystems and their services, in particular forests, wetlands, mountains, and drylands, in line with obligations under international agreements.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.2','Life on Land','By 2020, promote the implementation of sustainable management of all types of forests, halt deforestation, restore degraded forests, and substantially increase afforestation and reforestation globally.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.3','Life on Land','By 2030, combat desertification, restore degraded land and soil, including land affected by desertification, drought, and floods, and strive to achieve a land degradation-neutral world.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.4','Life on Land','By 2030, ensure the conservation of mountain ecosystems, including their biodiversity, in order to enhance their capacity to provide benefits that are essential for sustainable development.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.5','Life on Land','Take urgent and significant action to reduce the degradation of natural habitats, halt the loss of biodiversity, and, by 2020, protect and prevent the extinction of threatened species.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.6','Life on Land','Promote fair and equitable sharing of the benefits arising from the utilization of genetic resources and promote appropriate access to such resources, as internationally agreed.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.7','Life on Land','Take urgent action to end poaching and trafficking of protected species of flora and fauna and address both demand and supply of illegal wildlife products.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.8','Life on Land','By 2020, introduce measures to prevent the introduction and significantly reduce the impact of invasive alien species on land and water ecosystems and control or eradicate the priority species.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.9','Life on Land','By 2020, integrate ecosystem and biodiversity values into national and local planning, development processes, poverty reduction strategies, and accounts.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.a','Life on Land','Mobilize significant resources from all sources and at all levels to finance sustainable forest management and provide adequate incentives to developing countries to advance such management, including for conservation and reforestation.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.b','Life on Land','Mobilize significant resources from all sources and at all levels to finance sustainable forest management and provide adequate incentives to developing countries to advance such management, including for conservation and reforestation.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('15.c','Life on Land','Enhance global support for efforts to combat poaching and trafficking of protected species, including by increasing the capacity of local communities to pursue sustainable livelihood opportunities.','https://sdgs.un.org/goals/goal15');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16','Peace, Justice, and Strong Institutions','Promote peaceful and inclusive societies for sustainable development, provide access to justice for all, and build effective, accountable, and inclusive institutions at all levels.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.1','Peace, Justice, and Strong Institutions','Significantly reduce all forms of violence and related death rates everywhere.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.2','Peace, Justice, and Strong Institutions','End abuse, exploitation, trafficking, and all forms of violence against and torture of children.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.3','Peace, Justice, and Strong Institutions','Promote the rule of law at the national and international levels and ensure equal access to justice for all.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.4','Peace, Justice, and Strong Institutions','By 2030, significantly reduce illicit financial and arms flows, strengthen the recovery and return of stolen assets, and combat all forms of organized crime.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.5','Peace, Justice, and Strong Institutions','Substantially reduce corruption and bribery in all their forms.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.6','Peace, Justice, and Strong Institutions','Develop effective, accountable, and transparent institutions at all levels.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.7','Peace, Justice, and Strong Institutions','Ensure responsive, inclusive, participatory, and representative decision-making at all levels.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.8','Peace, Justice, and Strong Institutions','Broaden and strengthen the participation of developing countries in the institutions of global governance.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.9','Peace, Justice, and Strong Institutions','By 2030, provide legal identity for all, including birth registration.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.10','Peace, Justice, and Strong Institutions','Ensure public access to information and protect fundamental freedoms, in accordance with national legislation and international agreements.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.a','Peace, Justice, and Strong Institutions','Strengthen relevant national institutions, including through international cooperation, for building capacity at all levels, in particular in developing countries, to prevent violence and combat terrorism and crime.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('16.b','Peace, Justice, and Strong Institutions','Promote and enforce non-discriminatory laws and policies for sustainable development.','https://sdgs.un.org/goals/goal16');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17','Partnerships for the Goals','Strengthen the means of implementation and revitalize the global partnership for sustainable development.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.1','Partnerships for the Goals','Strengthen domestic resource mobilization, including through international support to developing countries, to improve domestic capacity for tax and other revenue collection.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.2','Partnerships for the Goals','Developed countries to implement fully their official development assistance commitments, including the commitment by many developed countries to achieve the target of 0.7 per cent of ODA/GNI to developing countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.3','Partnerships for the Goals','Mobilize additional financial resources for developing countries from multiple sources.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.4','Partnerships for the Goals','Assist developing countries in attaining long-term debt sustainability through coordinated policies aimed at fostering debt financing, debt relief, and debt restructuring.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.5','Partnerships for the Goals','Adopt and implement investment promotion regimes for least developed countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.6','Partnerships for the Goals','Enhance North-South, South-South, and triangular regional and international cooperation on and access to science, technology, and innovation.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.7','Partnerships for the Goals','Promote the development, transfer, dissemination, and diffusion of environmentally sound technologies to developing countries on favorable terms.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.8','Partnerships for the Goals','Fully operationalize the technology bank and science, technology, and innovation capacity-building mechanism for least developed countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.9','Partnerships for the Goals','Enhance international support for implementing effective and targeted capacity-building in developing countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.10','Partnerships for the Goals','Promote a universal, rules-based, open, non-discriminatory, and equitable multilateral trading system under the World Trade Organization.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.11','Partnerships for the Goals','Significantly increase the exports of developing countries, in particular with a view to doubling the least developed countries’ share of global exports by 2020.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.12','Partnerships for the Goals','Realize timely implementation of duty-free and quota-free market access on a lasting basis for all least developed countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.13','Partnerships for the Goals','Enhance global macroeconomic stability, including through policy coordination and policy coherence.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.14','Partnerships for the Goals','Enhance policy coherence for sustainable development.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.15','Partnerships for the Goals','Respect each country’s policy space and leadership to establish and implement policies for poverty eradication and sustainable development.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.16','Partnerships for the Goals','Enhance the global partnership for sustainable development, complemented by multi-stakeholder partnerships.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.17','Partnerships for the Goals','Encourage and promote effective public, public-private, and civil society partnerships.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.18','Partnerships for the Goals','Enhance capacity-building support to developing countries.','https://sdgs.un.org/goals/goal17');
INSERT INTO "sdgs" ("sdg_id","name","description","url") VALUES ('17.19','Partnerships for the Goals','By 2030, build on existing initiatives to develop measurements of progress on sustainable development.','https://sdgs.un.org/goals/goal17');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (1,'Job','A set of tasks and duties performed by one person for a single economic unit, in employment or family business, as defined by ILOSTAT ISCO-08.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (2,'Enterprise','Any entity engaged in economic activity, irrespective of size, stage of development, or legal structure. Includes micro, small, medium, and large enterprises.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (3,'Full-Time Equivalent (FTE)','Working time expected from a full-time job, often standardized to 1800 hours per year (225 working days at 8 hours/day).');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (4,'Decent Job','Jobs meeting standards of appropriate wages, no child or forced labor, non-discrimination, freedom of union, and safe working conditions.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (5,'Turnover','The total amount of money received by an enterprise from selling products, reflecting sales volume and price.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (6,'Beneficiary','Organizations or individuals benefiting from services rendered by German development cooperation.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (7,'Problematic Materials','Materials that rely on non-renewable resources, are non-recyclable, or pose environmental, social, or health risks when disposed of.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (8,'Green Job','Jobs contributing to environmental improvement or prevention of harm, e.g., in renewable energy, sustainable agriculture, or waste management.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (9,'Private Capital','Capital mobilized for investment by private entities such as enterprises, individuals, or civil society organizations.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (10,'Sustainable Development','Efforts contributing to the UN SDGs without significantly undermining any goals.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (11,'Participant','An individual engaged in GIZ-supported activities, such as training or project involvement, contributing to outcomes.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (12,'Business Operations','Core daily activities performed by an organization to create value and profit, including planning and process execution.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (13,'Investment','Capital expenditure aimed at acquiring assets for business expansion or creation, expecting financial or operational returns.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (14,'Income','Total earned income from economic activities, including cash and in-kind payments, generated through employment or self-employment.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (15,'Recycling','Conversion of materials into the same, higher, or lower value products, including upcycling and downcycling.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (16,'Turnover Sources','Categories contributing to business revenue, such as product sales or service offerings.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (17,'Economic Activity','Actions contributing to the production, distribution, or consumption of goods and services in economic systems.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (30,'SDG-relevant','A solution, policy, or intervention is considered SDG-relevant if it directly supports progress toward one or more Sustainable Development Goals (SDGs). This relevance is determined by its alignment with SDG targets and indicators, its contribution to solving a clearly identified sustainability challenge, and its potential for measurable impact on economic, social, or environmental dimensions of sustainable development.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (31,'Replication','The process of adopting and implementing a proven solution, model, or approach in a new geographic, institutional, or sectoral context.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (32,'Scalability','The ability of a solution to be expanded or adapted efficiently to a larger scope, such as additional regions, sectors, or populations, without significant loss of effectiveness.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (33,'Successful completion','Completion of a program or initiative by meeting pre-defined criteria, such as passing an exam or obtaining an accredited certification.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (34,'Meso-level actors','An organization that operates at an intermediary level, bridging macro-level policymakers and micro-level businesses or individuals. Examples include business associations, chambers of commerce, innovation hubs, and startup networks.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (35,'Pilot measure','A structured initiative designed to test, refine, and validate an approach, intervention, or solution before broader implementation. Pilot measures serve as a controlled environment to assess feasibility, effectiveness, and scalability.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (36,'Open Innovation Competition','A competitive process where individuals, organizations, or startups submit innovative ideas to address predefined challenges, fostering creativity and participation beyond traditional institutional boundaries.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (37,'Startup','A newly established business, typically in the early stages of operation, focused on developing an innovative product or service with high growth potential.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (39,'Incubation and Innovation Center','An institution that supports startups and entrepreneurs by providing funding, mentorship, networking, and access to resources to accelerate business growth.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (40,'Digital Public Services','Government-provided services that are accessible online, such as digital identity registration, e-governance, and online public assistance programs.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (41,'Digital Inclusion','Ensuring that all individuals and communities, particularly marginalized groups, have access to and can effectively use digital technologies and services.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (42,'Innovative Solution','A new or improved product, service, or approach that enhances accessibility, efficiency, or user engagement in digital public services.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (43,'Digital Ecosystem','A network of stakeholders, including governments, businesses, civil society, and technology providers, working together to develop and expand digital services.');
INSERT INTO "packages" ("package_id","name","definition") VALUES (1,'SME-Loop','The aim of the MSME Business Training and Coaching Loop (MSME Loop) is to enhance entrepreneurial competencies of business owners of existing micro, small and medium enterprises (MSME) to increase employment and income opportunities for poor people in rural and peri-urban areas. ');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (1,'Climate, environment, management of natural resources','Conserving natural resources is a basic requirement for sustainable development and improving the quality of human life. To reverse the trend towards resource degradation, we need to give greater priority to ecological principles.

GIZ assists its partners in identifying the wide range of causes of environmental risks. It helps modernise environmental policy at all levels, advises on regional environmental cooperation and develops strategies to embed environmental protection in other areas of policy.
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (2,'Economic development and employment','Economic growth is a fundamental requirement for the development of a country. For companies to invest and an economy to grow, stable environments, efficient institutions, functioning markets and access to sustainable financial services are all required. GIZ assists its partner countries in improving their economic framework conditions, removing bureaucratic obstacles and establishing suitable promotional structures.

Through dialogue between public and private actors, we develop comparative advantages and initiate multisectoral economic flows. We advise on economic policy and work with our partners to develop solutions for private sector promotion, and local, poverty-oriented financial systems to give everyone an opportunity to share the benefits of economic growth.
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (3,'Governance and democracy','A peaceful and productive society is based on effective state institutions. Good governance in this sense means effective and efficient structures which provide optimal support to citizens in leading a safe and productive life in line with their desires and opportunities. Essentially, this involves a combination of democracy, the social welfare state and the rule of law.

Promotion of good governance goes beyond the government sector and includes all relevant actors from the private sector and society. The aims: To balance interests and focus on common goals, particularly reducing poverty and providing access to state services for all. To make administrative structures participative, efficient and solution oriented.
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (4,'Rural development','In many developing countries, food security and rural development are ongoing challenges. Most poor people in the world live in rural regions. Based on years of experience and comprehensive know-how, GIZ offers regionally adapted strategies to secure the right to food and make rural development a driver for economic takeoff.

We advise our partners on agricultural and rural development policy. Farmers and associations are involved in decisions and organisational deficits are addressed. This is the only way to give poor people in rural areas access to land, water, loans and training. In cooperation with academic institutions and the private sector, we develop strategies for increasing production and income under changing conditions in agriculture and fishing, in ways which do not burden the environment or reduce biodiversity. At the same time, it is important to develop rural infrastructure and create access to markets.
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (5,'Security, reconstruction and peace','Violent conflicts and natural disasters threaten the lives and livelihoods of millions of people worldwide. We support our partners in alleviating the structural causes of violent conflict and developing capacities for peaceful conflict transformation.

We help them assure the safety of the population and reduce the impact of natural disasters and violent conflict by means of preventive measures, emergency aid and reconstruction programmes. In this way, we aim to stabilise fragile contexts in order to make development a reality for all sections of society.

Our strength lies in linking short-term aid with long-term prospects. In the security sector, we support the demobilisation and reintegration of ex-combatants and provide advice on the build up and reform of capable, democratically legitimate and monitored institutions.');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (6,'Social development','A peaceful society worth living in is based on basic social policy values, such as equality of opportunity, solidarity and participation. Long term social policy investments in society promote sustainable development and economic growth. Education, health and social protection systems provide people with an opportunity to develop from their own resources and live independently. More – education and health are human rights.

Education is a powerful driver of development. We promote formal and informal education in preschool, basic education and university education. To make optimal use of the potential of young people, we develop concepts for economic and social integration and empowerment of youth.
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (7,'Sustainable infrastructure: water, energy, transport','The importance of infrastructure is often only recognised when it is lacking. Infrastructure enables an economic upturn and therefore provides an important basis for better living conditions. Water, energy and transport are the source, carrier and motor of development.

Water is a source of vital nutrients and the basis for hygiene. But it is an economic good and production factor, too. Access to this essential resource and to good sanitation is essential for health, peaceful coexistence and productivity. 
');
INSERT INTO "sectors" ("sector_id","name","description") VALUES (8,'Cross-sector','Indicators and initiatives that are relevant across multiple sectors, fostering interdisciplinary collaboration and holistic approaches to development challenges.');
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (1,1);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (1,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (1,3);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (1,4);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (2,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (2,5);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (3,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (3,12);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (4,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (4,7);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (5,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (5,9);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (5,10);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (6,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (6,6);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (6,11);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (7,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (8,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (9,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (10,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (11,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (11,12);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (12,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (13,1);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (14,1);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (15,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (15,14);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (16,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (24,30);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (24,31);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (24,32);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (25,33);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (25,34);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (25,35);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (26,30);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (26,36);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (27,37);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (27,39);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (27,2);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (28,40);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (28,41);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (28,42);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (28,43);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (8,39);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (8,42);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (7,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (8,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (9,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (10,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (11,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (12,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (13,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (14,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (15,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (16,1);
INSERT INTO "indicator_packages" ("indicator_id","package_id") VALUES (2,1);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (1,'Employment and Jobs','Covers indicators related to job creation, decent work, and workforce participation.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (2,'Enterprise Development','Focuses on indicators about the growth, sustainability, and management of enterprises.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (3,'Environmental Sustainability','Includes indicators related to green practices, resource efficiency, and reduction of harmful impacts.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (4,'Economic Growth','Addresses indicators on income generation, turnover, and financial performance at individual and organizational levels.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (5,'Social Inclusion','Covers indicators about marginalized populations, gender equality, and equitable access to opportunities.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (6,'Training and Capacity Building','Focuses on indicators related to skills development, education, and technical assistance.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (7,'Sustainable Resource Use','Includes indicators on recycling, waste management, and efficient use of materials.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (8,'Investment and Capital Mobilization','Addresses indicators related to financial investments and private sector contributions.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (9,'Health and Well-being','Covers indicators on health outcomes, safety standards, and the well-being of participants.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (10,'Innovation and Technology','Focuses on indicators related to the adoption and impact of innovative practices and technologies.',2);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (16,'Replication of successful activities','Implemented activities and successes are replicated in other contexts / countries',8);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (17,'Capacity development','All activities specifically aimed at building or strengthening the capacities of individuals and institutions',8);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (18,'Digital transformation','The process of integrating digital technologies into all aspects of society, businesses, and governance to improve efficiency, accessibility, and innovation, while fostering inclusion and sustainable development.',8);
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (6,'0010','Unternehmensebene');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (7,'0020','Beauftragte auf Unternehmensebene');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (8,'0090','Betriebsrat Eschborn');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (9,'0091','PVA');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (10,'0093','Betriebsrat Bonn');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (11,'0094','Betriebsrat Berlin');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (12,'0095','Gleichstellung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (13,'0096','Schwerbehindertenvertretung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (14,'0200','Unternehmenskommunikation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (15,'0210','Medien- & Öffentlichkeitsarbeit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (16,'0213','Presse');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (17,'0214','Onlinekommunikation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (18,'0220','Interne Kommunikation & Beratung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (19,'0230','Kommunikationsstrategie');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (20,'0250','Kommunikationsberatung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (21,'0300','Revision');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (22,'0310','Revisionsteam 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (23,'0320','Revisionsteam 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (24,'0400','Unternehmensentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (25,'0410','Unternehmenspolitik und Risikomanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (26,'0411','Grundsätze und Rechenschaftsmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (27,'0412','Risikomanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (28,'0420','Gremien und strategische Partnerschaften');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (29,'0430','Unternehmensorganisation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (30,'0431','Organisationsentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (31,'0432','Regelwerk und Geschäftsfähigkeit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (32,'0450','Repräsentanz Berlin');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (33,'0470','Repräsentanz Brüssel');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (34,'0480','Qualität und Nachhaltigkeit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (35,'0490','Transformationsmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (36,'0500','Recht und Versicherung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (37,'05A0','Recht 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (38,'05B0','Recht 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (39,'0800','Evaluierung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (40,'0810','USE, Evaluierungsberatung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (41,'0820','Zentrale Projektevaluierungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (42,'0B00','Akademie für Int. Zusammenarbeit (AIZ)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (43,'0B10','Kundenservice und Kommunikation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (44,'0B30','Portfolio + Lerninnovation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (45,'0B40','Learning Center 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (46,'0B50','Learning Center 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (47,'0B60','Learning Center 3');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (48,'0B70','Kompetenzentwicklung/Berufliche Bildung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (49,'0B80','Tagungsmanagement Campus Kottenforst');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (50,'0B90','Digitale Transformation und Lernsysteme');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (51,'0C00','Governance, Risk, Compliance');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (52,'0C10','Compl. u. Integritätsberat., Fallmgmt.');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (53,'0C20','GRC-Managementsysteme');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (54,'0D00','Unternehmenssicherheit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (55,'0D10','Sicherheitsrisiko- und Krisenmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (56,'0I00','Information Governance');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (57,'1000','Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (58,'1015','Bereichsprozesse');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (59,'1100','Westafrika 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (60,'1300','Südliches Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (61,'1400','Zentralafrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (62,'1500','Ostafrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (63,'1600','Westafrika 2, Madagaskar');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (64,'1700','Afrika Überregional und Horn von Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (65,'1710','Regionale Vorhaben Afrika 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (66,'1720','Regionale Vorhaben Afrika 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (67,'1730','Digitale Transformation in Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (68,'1740','Afrikanische Union');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (69,'2000','Asien, Pazifik, Lateinamerika, Karibik');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (70,'2A00','Asien I');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (71,'2B00','Asien II');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (72,'2B10','Bangladesch, Pakistan');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (73,'2B20','Afghanistan');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (74,'2C00','Lateinamerika, Karibik');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (75,'2C10','Länderübergreifd. Ansätze und Qualität');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (76,'2D00','Themen & Leistungen,Portfolioentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (77,'2D10','Bereichsübergr. digit.Auftragsmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (78,'2D20','Klimakoordination APLAK');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (79,'3000','Europa, Mittelmeer, Zentralasien');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (80,'3010','Bereichskoordination');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (81,'3300','Naher und Mittlerer Osten 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (82,'3600','Nordafrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (83,'3700','Westbalkan, Zentralasien, Osteuropa');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (84,'3710','Auftraggeberprozesse und Qualität');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (85,'3900','Deutschland, Europa, Südkaukasus');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (86,'3910','Region West');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (87,'3920','Region Süd');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (88,'3930','Region Ost');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (89,'3940','Region Nord');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (90,'3950','Sonderprogr.Ukraine/länderübergr.Aufg.');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (91,'3A00','Naher und Mittlerer Osten 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (92,'4000','[FMB] Fach- und Methodenbereich');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (93,'4A00','[FMB] Portal für Interne Kunden');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (94,'4A10','[FMB] Qualitätsprüfung Angebote, Koord. Arb.au');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (95,'4A20','[FMB] Flexibles Operatives Einsatzteam');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (96,'4A30','[FMB] Safeguards und Gender Managementsystem');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (97,'4A40','[FMB] Werksteam 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (98,'4A50','[FMB] Werksteam 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (99,'4A60','[FMB] Werksteam 3');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (100,'4B00','[FMB] Wirtschaft,Beschäftigung,soziale Entwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (101,'4B10','[FMB] Bildung,Berufliche Bildung,Arbeitsmarkt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (102,'4B20','[FMB] Finanzsystementwicklung, Versicherungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (103,'4B30','[FMB] Gesundheit und Soziale Sicherung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (104,'4B40','[FMB] Wirtschaftspolitik und Privatwirtförderung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (105,'4C00','[FMB] Governance und Konflikt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (106,'4C10','[FMB] Rechtsstaat, Gender, Sicherheit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (107,'4C20','[FMB] Öffentliche Finanzen und Verwaltung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (108,'4C30','[FMB] Demokratie, Digital Governance, Stadt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (109,'4C40','[FMB] Krisenbewältigung und Friedensförderung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (110,'4D00','[FMB] Klima, ländl. Entwicklung, Infrastruktur');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (111,'4D10','[FMB] Klimawandel');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (112,'4D20','[FMB] Wald, Biodiversität, Landwirtschaft');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (113,'4D30','[FMB] Ländl. Entwicklung, Ernährungssicherung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (114,'4D40','[FMB] Wasser, Abwasser, Abfall');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (115,'4D50','[FMB] Energie und Verkehr');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (116,'4D60','[FMB] Umwelt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (117,'4E00','[FMB] Methoden, digitale Transform, Innovation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (118,'4E10','[FMB] Veränderungsmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (119,'4E20','[FMB] Digitale Gesellschaft');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (120,'4E30','[FMB] Innovation, Lernen, Wissen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (121,'5000','Finanzen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (122,'5010','Bereichskoordination');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (123,'5100','Unternehmenscontrolling');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (124,'5110','Gemeinkosten,Drittmittel,Wirtschaftlichk');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (125,'5120','Titelsteuerung und Auftragscontrolling');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (126,'5200','Rechnungswesen und Steuern');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (127,'5210','Externes Rechnungswesen und Steuern');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (128,'5220','Internes Rechnungswesen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (129,'5240','Kreditorenbuchhaltung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (130,'5250','Finanzdisposition und Zahlungsverkehr');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (131,'5260','Projektbuchhaltung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (132,'5270','Fachliche Systemkoordination');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (133,'5600','Beratung Finanzmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (134,'5610','Auftraggeber- und Geschäftsentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (135,'5620','Sektor- und Globalvorhaben');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (136,'5630','Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (137,'5640','Asien, Lateinamerika, Karibik');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (138,'5650','Europa, Mittelmeer, Zentralasien');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (139,'5660','Kalkulation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (140,'5700','Service Finanzen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (141,'5720','Finanzielle Vertragsabwicklung 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (142,'5730','Finanzielle Vertragsabwicklung 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (143,'5740','Auftragsabrechnung, Prüfungskoordination');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (144,'5750','Finanzielle Vertragsabwicklung 3');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (145,'6000','Personal');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (146,'6060','Koordination und Controlling');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (147,'6200','HR-Competence');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (148,'6210','HRStrategy,Compensation&Labour Relations');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (149,'6220','Personal- und Karriereentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (150,'6240','EntwicklungshelferInnen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (151,'6270','HR Digital und Innovation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (152,'6500','Gesundheitsservices');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (153,'6520','COPE');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (154,'6530','Assistenz Medizinischer Dienst');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (155,'6600','HR-Solutions');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (156,'6610','HR Planning and Development');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (157,'6620','HR-Partner');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (158,'6630','Regionale HR-Hubs');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (159,'6640','Nachwuchsprogramme');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (160,'6641','Betriebliche Ausbildung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (161,'6642','Einstiegsqualifikanten');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (162,'6643','EZ-Trainees');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (163,'6644','Kaufmännische Trainees');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (164,'6900','HR-Services');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (165,'69A0','HR-Service Center');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (166,'69B0','Einsatzmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (167,'69C0','Rekrutierung - Interner Arbeitsmarkt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (168,'69D0','Rekrutierung - Externer Arbeitsmarkt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (169,'69E0','Arbeitsvertragsmanagement Inland');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (170,'69F0','Arbeitsvertragsmanagement Ausland');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (171,'69G0','Krise, Recht und Sonderthemen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (172,'69H0','Arbeitsvertragsänderung und -leistungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (173,'69I0','HR-Global');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (174,'69K0','EH / IF Betreuung und Abrechnung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (175,'69L0','Gehalt 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (176,'69M0','Gehalt 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (177,'69N0','Sozialwesen und Steuern');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (178,'69P0','Rekrutierung - Führungskräfte');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (179,'69Q0','Zeitmanagement und Gehalt');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (180,'7000','International Services');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (181,'7100','Operations');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (182,'7110','Europa, Mittelmeer, Zentralasien (EMZ)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (183,'7130','Afrika');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (184,'7140','Asien, Pazifik, Lateinamerika, Karibik');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (185,'7160','Sonstige Projekte');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (186,'7180','Märkte und Kunden');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (187,'7800','Finanzen und Personal');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (188,'7810','Finanzen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (189,'7820','Verträge und Recht');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (190,'7830','Personal');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (191,'A000','Auftraggeber und Geschäftsentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (192,'A100','Auftraggeber');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (193,'A101','Verbindungsbüro BMZ');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (194,'A110','VB AA, BMI, BMJ, BMVg, BMWSB');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (195,'A120','Verbindungsbüro BMEL, BMUV');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (196,'A130','VB BMWK,BMF,BMAS,BMBF,BMDV,BMFSFJ,BMG');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (197,'A140','Verbindungsbüro EU');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (198,'A150','Verbindungsbüro Internationale Geber');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (199,'A160','Verbindungsbüro Green Climate Fund');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (200,'A170','VB Unternehmen und Stiftungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (201,'A200','Geschäftsentwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (202,'A220','Geschäftsentwicklung 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (203,'A230','Geschäftsentwicklung 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (204,'A300','Verw.- u. Projektdienstleistungen der IZ');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (205,'D000','Digitale Transformation und IT Solutions');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (206,'D010','Bereichscontrolling');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (207,'D020','Bereichskoordination');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (208,'D100','Projekt- und Portfoliomanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (209,'D110','IT Beratung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (210,'D120','Digital Change und Ressourcen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (211,'D130','Digitalportfoliostrategie u. -governance');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (212,'D200','IT Entwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (213,'D210','IT Solutions Finanzen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (214,'D220','IT Solutions Auftrag und Beschaffung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (215,'D230','IT Solutions Personal');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (216,'D240','IT Solutions Cross Application');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (217,'D250','IT-Solutions Web-u.Individualanwendungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (218,'D300','Betrieb');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (219,'D310','Basis Infrastruktur');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (220,'D320','Digitaler Arbeitsplatz-Cloud Services 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (221,'D330','Identitätsmanagement und Cyber Security');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (222,'D340','Digitaler Arbeitsplatz-Cloud Services 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (223,'D360','Digitaler Arbeitsplatz - Clients');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (224,'D370','Cloud Infrastruktur');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (225,'D400','Global IT Services');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (226,'D420','IT Service Center');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (227,'D440','Glob. Unterstützung IT & Dig. Netzwerke');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (228,'D450','Identitäts- und Accessmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (229,'D500','Informationssicherheit und Datenschutz');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (230,'D510','Informationssicherheitsmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (231,'D520','Datenschutzmanagement');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (232,'E000','ELVIS');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (233,'E010','Sprachendienst');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (234,'E200','Einkauf und Verträge');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (235,'E210','Sachgüter 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (236,'E220','Sachgüter 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (237,'E230','Digitalisierung, Compliance und Support');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (238,'E240','Controlling, Wissen, Prüfung und ZAB');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (239,'E250','Dienstleistungen Unterschwelle 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (240,'E260','Dienstleistungen Unterschwelle 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (241,'E270','Dienstleistungen Unterschwelle 3');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (242,'E280','Dienstleistungen Unterschwelle 4');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (243,'E290','Dienstleistungen Unterschwelle 5');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (244,'E2A0','Dienstleistungen Oberschwelle und IT');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (245,'E2B0','Finanzierungen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (246,'E2D0','Dienstl. Unterschwelle 6 und Bauverträge');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (247,'E300','Liegenschaften 1');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (248,'E310','LM Bad Honnef, Röttgen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (249,'E350','LM Feldafing');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (250,'E380','LM Bonn (Kommunikation und Services)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (251,'E390','LM Bonn (Flächen- und Gebäudemgmt)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (252,'E400','Liegenschaften 2');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (253,'E410','LM Eschborn (Kommunikation und Services)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (254,'E420','LM Eschborn (Flächen- und Gebäudemgmt)');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (255,'E450','Kfm. DL u. Digitalisierung LM');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (256,'E460','LM Berlin Komm. u. Service, Flächen-Geb');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (257,'G000','Sektor- und Globalvorhaben');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (258,'G020','Auftragsmanagement & Digitalisierung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (259,'G100','Wirtschaft, Soziales, Digitalisierung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (260,'G110','Gesundheit, Bildung, Soziales');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (261,'G120','Nachhaltige Wirtschentw, Digitalisierung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (262,'G130','Zusammenarbeit mit der Wirtschaft');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (263,'G200','Krisen-u.Konfliktmanagmt,Migration,Bauen');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (264,'G210','Flucht, Migration, Rückkehr');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (265,'G220','Frieden und Sicherheit');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (266,'G230','Bauen in der IZ');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (267,'G260','Übergangshilfe');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (268,'G300','Klima, Umwelt, Infrastruktur');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (269,'G310','Energie, Wasser, Verkehr');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (270,'G320','Klima und Klimapolitik');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (271,'G330','Umweltpolitik, Biodiversität, Wald');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (272,'G400','Global Policy, Governance');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (273,'G410','Global Policy');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (274,'G420','Governance, Menschenrechte');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (275,'G430','Cities');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (276,'G500','Ländliche Entwicklung, Agrarwirtschaft');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (277,'G510','Wertschöpfung, Innovation');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (278,'G520','Ländliche Entwicklung');
INSERT INTO "units" ("unit_id","unit_shortname","unit_longname") VALUES (279,'G530','Globale Agenden für Ernährungssicherung');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (1,'Abfall- und Kreislaufwirtschaft, Ressourceneffizienz','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (2,'Agenda 2030','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (3,'Agrarbasierte Wirtschaftsentwicklung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (4,'Agrarhandel & Standards','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (5,'Agrarpolitik und Entwicklung ländlicher Räume','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (6,'Anpassung an den Klimawandel','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (7,'Antikorruption & Integrität','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (8,'Arbeitsmarkt und Beschäftigung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (9,'Bauen in der IZ','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (10,'Bekämpfung illegaler Finanzströme/IFF','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (11,'Berufliche Bildung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (12,'Bildung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (13,'Biologische Vielfalt','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (14,'Dezentralisierung & Lokale Regierungsführung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (15,'Digital Economy','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (16,'Digital Governance and Society','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (17,'Energie','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (18,'Ernährungssicherung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (19,'Flucht und Migration','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (20,'Frieden & soziale Kohäsion','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (21,'Gleichberechtigung der Geschlechter','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (22,'Global Governance & Multilateralismus','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (23,'Global Health','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (24,'Green Economy','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (25,'Handel','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (26,'Hochschule und Wissenschaft','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (27,'Inclusive Finance','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (28,'Inklusion von Menschen mit Behinderungen','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (29,'Investitionen','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (30,'Jugend und Sport für Entwicklung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (31,'Klimaschutz (Minderung)','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (32,'Land Governance','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (33,'Landwirtschaft','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (34,'Ländliches Finanzwesen, Agrar- und KMU-Finanzierung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (35,'Meere und Küsten','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (36,'Menschenrechte','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (37,'Nachhaltiger Verkehr','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (38,'One Health','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (39,'Politische & soziale Teilhabe','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (40,'Privatwirtschaftsförderung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (41,'Prävention und Bewältigung akuter Krisen und Katastrophen','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (42,'Recht & Justiz','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (43,'Regionale und sektorale Wirtschaftsförderung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (44,'Rohstoffe','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (45,'Sicherheit','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (46,'Systeme Sozialer Sicherung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (47,'Umwelt- und Klimafinanzierung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (48,'Umweltpolitik, Umweltökonomie, Umweltmanagement','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (49,'Universal Health Coverage','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (50,'Urbanisierung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (51,'Versicherungen','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (52,'Wald','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (53,'Wasser für Entwicklung','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (54,'Wirtschaftspolitik','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (55,'Öffentliche Finanzen','Fach-TOPIC');
INSERT INTO "sap_topics" ("topic_id","topic_name","topic_cat") VALUES (56,'Öffentliche Verwaltung','Fach-TOPIC');
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (1,8);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (1,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (2,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (2,29);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (3,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (3,29);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (4,48);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (4,1);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (5,47);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (5,37);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (5,31);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (6,21);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (6,36);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (6,28);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (7,31);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (7,34);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (8,25);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (8,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (9,42);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (9,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (10,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (10,29);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (11,25);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (11,42);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (12,25);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (12,43);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (13,8);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (13,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (14,8);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (14,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (15,8);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (15,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (16,8);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (16,42);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (24,22);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (24,16);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (25,15);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (25,11);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (25,26);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (26,15);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (26,16);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (26,25);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (27,40);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (27,31);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (28,15);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (28,16);
INSERT INTO "indicator_saptopics" ("indicator_id","topic_id") VALUES (28,21);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (1,1,'Total number of jobs at enterprise (in FTEs)','Measures the total number of full-time equivalent positions in an enterprise.','FTEs','Gender, age, employment type','Enterprise surveys, administrative records','Providing financial and/or technical support to enterprises can lead to higher job creation.','8.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (2,2,'Turnover','Reflects the total sales revenue of an enterprise over a given period.','Currency (e.g., USD, EUR)','Sector, region','Financial reports, tax records','Increased turnover indicates improved business operations and market demand.','8.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (3,2,'Total number of enterprises with improved business operations management','Tracks the number of enterprises implementing better management practices.','Number','Sector, size of enterprise','Interviews, project reports','Improved business operations management boosts efficiency and profitability.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (4,3,'Total amount of problematic materials reduced in production of goods at enterprise','Measures the reduction of environmentally harmful materials used in production.','Tons','Material type','Enterprise self-reporting, audits','Reducing problematic materials improves sustainability and reduces environmental harm.','12.4','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (5,8,'Total amount of private capital mobilized from enterprise for investment in sustainable development','Tracks private investment contributions to sustainability initiatives.','Currency (e.g., USD, EUR)','Sector, type of investment','Financial records, surveys','Mobilizing private capital accelerates progress toward sustainable development.','17.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (6,5,'Total number of marginalized people benefiting from enterprise operations','Measures the number of marginalized individuals positively impacted by enterprise activities.','Number','Gender, age, group','Beneficiary surveys, reports','Supporting marginalized populations enhances social equity and inclusion.','10.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (7,8,'Access to financial services','Tracks the number of enterprises or individuals gaining access to financial products or services.','Number','Type of financial service, region','Surveys, administrative data','Improved access to financial services enables business growth and economic inclusion.','8','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (8,2,'New products and services','Measures the number of new products or services introduced by enterprises.','Number','Sector, type of product/service','Enterprise reports, market data','Innovation in products and services boosts market competitiveness and consumer satisfaction.','9.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (9,2,'Formalisation','Tracks the number of informal enterprises transitioning to formal status.','Number','Sector, region','Administrative records, enterprise surveys','Formalisation enhances access to markets, finance, and legal protections.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (10,2,'Profit (before tax)','Measures the total profit generated by an enterprise before tax deductions.','Currency (e.g., USD, EUR)','Sector, region','Financial reports, tax records','Profitability is a key indicator of business health and sustainability.','8.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (11,2,'Formalised business relationships','Measures the number of formalized contracts or partnerships established by an enterprise.','Number','Sector, region','Enterprise records, partnership agreements','Formalized relationships enhance business credibility and market access.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (12,9,'Access to markets','Tracks the number of enterprises or individuals gaining access to local, regional, or international markets.','Number','Market type, region','Market surveys, enterprise reports','Access to markets enables business growth and economic opportunities.','8.a','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (13,1,'Jobs created','Measures the total number of jobs created through project interventions.','Number','Gender, age, employment type','Project reports, administrative data','Job creation contributes to economic growth and poverty reduction.','8.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (14,1,'Additional employment','Measures the number of additional employment opportunities created, beyond initial project goals.','Number','Gender, age, employment type','Enterprise surveys, payroll records','Additional employment strengthens workforce participation and economic stability.','8.5','You can find more information on this indicator here: https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf and here https://unstats.un.org/sdgs/metadata/?Goal=8&Target=8.5','TRUE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (15,5,'Higher income (entrepreneur/employees)','Tracks the increase in income for entrepreneurs and employees resulting from project support.','Currency (e.g., USD, EUR)','Gender, region, sector','Surveys, financial records','Higher income improves living standards and supports economic development.','10.1','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (16,9,'Improved working conditions','Measures improvements in workplace safety, facilities, and employment benefits.','Number','Type of improvement, region','Workplace audits, employee surveys','Improved working conditions enhance employee satisfaction and productivity.','8.8','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Outcome',104);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (24,16,'Adoption of SDG-Relevant Solutions in Other Countries','This indicator measures the extent to which SDG-relevant solutions developed within a project or program are replicated and applied in other countries. The indicator tracks the transfer and implementation of such solutions beyond their original context, demonstrating scalability and cross-border impact.','Number of countries','Region / continent; SDG goal; type of solution  (policy, technology, business model, capacity-building approach, etc.)','Review of national strategies and action plans in target countries;
Analysis of policy implementation reports;
Evaluation of meeting minutes from networking events and conferences;
Publicly available SDG monitoring reports from national and international sources','If SDG-relevant solutions developed in one country are successfully implemented in other countries, this demonstrates their scalability and effectiveness. The international adoption of solutions fosters regional integration, policy alignment, and knowledge transfer, leading to accelerated progress toward achieving the Sustainable Development Goals (SDGs) on a broader scale.','17','This indicator is not sector-specific and applies to all fields where SDG solutions are developed; 
Solutions could include policy recommendations, digital innovations, business models, or governance strategies; 
The adoption of solutions can be fully or partially implemented in new contexts.','FALSE','Outcome',119);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (25,18,'Successful Participation in Pilot Measures for Digital and Entrepreneurial Skills','This indicator measures the number of participants who successfully complete pilot initiatives led by meso-level actors to enhance their digital and entrepreneurial competencies.','Number of participants successfully completing the pilot measures','Gender; type of meso-level actor (e.g., public institution, private sector organization, business association, civil society organization, innovation hub); type of intervention (e.g., training, certification, platform integration)','Analysis of participant lists from the pilot programs; Review of issued certificates; Assessment results from final tests or accreditation processes','If meso-level actors provide structured training and certification programs, participants will improve their digital and entrepreneurial skills, increasing their employability, business success, and economic resilience. Strengthening the capacity of intermediary institutions ensures long-term sustainability in supporting digital transformation and entrepreneurship.','4','','FALSE','Outcome',119);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (26,18,'Development of SDG-Relevant Digital Solutions','This indicator measures the number of digital solutions developed by a dedicated partner, center or initiative that explicitly contribute to the Sustainable Development Goals (SDGs). These solutions may be developed: In collaboration with sector ministries to ensure policy alignment and institutional support; As a result of open innovation competitions, where ideas are sourced from diverse stakeholders.','Number of SDG-relevant digital solutions developed','Ddevelopment approach (e.g., sector ministry collaboration, open competition); Thematic SDG focus (e.g., health, education, climate action); Implementation status (e.g., prototype, pilot stage, fully deployed)','Project documentation reviews; Press releases and public announcements; Minutes from meetings with sector ministries; Records demonstrating SDG alignment; Documentation of open competitions and winning solutions','If digital innovations are developed with a clear SDG focus, they can address critical development challenges more effectively. Engaging sector ministries ensures institutional ownership and scalability, while open innovation competitions foster inclusive participation and diverse problem-solving approaches.','9','Digital solutions can include apps, platforms, data-driven tools, AI-powered systems, and e-governance solutions; Open competitions provide an opportunity for entrepreneurs, civil society, and researchers to contribute innovative ideas.','FALSE','Output',119);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (27,18,'Startups Receiving Financial Support for Business Formation','This indicator measures the number of startups that have received financial support from an incubation or innovation center to establish or expand their business operations. The support aims to enhance entrepreneurial success, business sustainability, and innovation-driven growth.','Number of startups financially supported','Type of financial support (e.g., grants, seed funding, equity investment, subsidized loans); Sector (e.g., technology, agriculture, renewable energy); Startup maturity level (e.g., early-stage, growth-stage); Founder characteristics (e.g., gender, youth-led, minority-led businesses)','Review of financing agreements/contracts between the incubation center and supported startups; Surveys and interviews with funded startups to assess impact and usage of financial support; Financial records and disbursement reports from the incubation center','If startups receive financial support in their early stages, they are more likely to survive, scale, and contribute to economic development. Incubation and innovation centers play a crucial role in providing not only funding but also mentorship, networking, and capacity-building opportunities.','9','Financial support can come in various forms, including grants, soft loans, convertible equity, or performance-based financing. Incubation centers often complement financial support with training, mentoring, and networking opportunities.','FALSE','Output',119);
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level","responsible_unit") VALUES (28,18,'Innovative Solutions for Digital Awareness and Inclusion','This indicator measures the number of innovative solutions that have been developed and implemented to increase public awareness and digital inclusion, particularly among marginalized groups such as women, for the adoption of digital public services. These solutions should be developed in collaboration with the digital ecosystem and aim to improve accessibility, usability, and engagement.','Number of innovative solutions introduced','Type of solution (e.g., digital literacy platforms, mobile applications, public outreach campaigns, interactive digital kiosks); Target group (e.g., women, rural populations, persons with disabilities); Partnership type (e.g., public-private collaboration, government-led, civil society involvement)','Assessment of the content, functionalities, and accessibility of the innovative solutions; User feedback and engagement metrics (e.g., number of users, completion rates, satisfaction surveys); Documentation and progress reports from implementing partners','If innovative digital solutions are developed and tailored to the needs of marginalized populations, then digital inclusion and awareness will increase, leading to higher adoption of digital public services. This, in turn, can improve access to government services, participation in the digital economy, and social inclusion.','5','The digital ecosystem includes government institutions, private sector actors, civil society organizations, and technology providers that contribute to digital service delivery. Solutions should ensure user-centric design, accessibility standards, and sustainability beyond initial implementation.','FALSE','Output',119);
COMMIT;
