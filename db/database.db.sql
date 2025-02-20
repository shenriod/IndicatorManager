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
	PRIMARY KEY("indicator_id","concept_id"),
	FOREIGN KEY("concept_id") REFERENCES "key_concepts"("concept_id"),
	FOREIGN KEY("indicator_id") REFERENCES "indicators"("indicator_id")
);
CREATE TABLE IF NOT EXISTS "indicator_packages" (
	"indicator_id"	INTEGER NOT NULL,
	"package_id"	INTEGER NOT NULL,
	FOREIGN KEY("package_id") REFERENCES "packages"("package_id"),
	FOREIGN KEY("indicator_id") REFERENCES "indicators"("indicator_id"),
	PRIMARY KEY("indicator_id","package_id")
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
	PRIMARY KEY("indicator_id" AUTOINCREMENT),
	FOREIGN KEY("theme_id") REFERENCES "themes"("theme_id"),
	FOREIGN KEY("sdg_id") REFERENCES "sdgs"("sdg_id")
);
CREATE TABLE IF NOT EXISTS "themes" (
	"theme_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"sector_id"	INTEGER,
	PRIMARY KEY("theme_id" AUTOINCREMENT),
	FOREIGN KEY("sector_id") REFERENCES "sectors"("sector_id")
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
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (18,'Disasters','A serious disruption of the functioning of a community or a society at any scale due to
hazardous events interacting with conditions of exposure, vulnerability and capacity, leading to one or
more of the following: human, material, economic and environmental losses and impacts (UNDRR, 2017,
https://www.preventionweb.net/terminology/disaster).');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (19,'Death','The number of people who died during the disaster, or directly after, as a direct result of the
hazardous event');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (20,'Missing persons','The number of people whose whereabouts is unknown since the hazardous event. It
includes people who are presumed dead, for whom there is no physical evidence such as a body, and for
which an official/legal report has been filed with competent authorities.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (21,'Disaster-affected persons','People who are affected, either directly or indirectly, by a hazardous event.
Directly affected are those who have suffered injury, illness or other health effects. Indirectly affected are
people who have suffered consequences, other than or in addition to direct effects (UNDRR, 2017,
https://www.preventionweb.net/terminology/disaster).');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (22,'Livelihood','The capacities, productive assets (both living and material) and activities required for securing
a means of living, on a sustainable basis, with dignity');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (23,'Electricity access','Refers to the proportion of population in the considered area (country,
region, and global context) that has access to consistent sources of electricity.
The World Bank’s Global Electrification Database compiles nationally representative household survey data
as well as census data since 1990. It also incorporates data from the Socio-Economic Database for Latin America and the Caribbean, the Middle East and North Africa Poverty Database, and the Europe and
Central Asia Poverty Database, all of which are based on similar surveys');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (24,'Forest','According to the FAO, Forest is defined as: “land spanning more than 0.5 hectares with trees higher than
5 meters and a canopy cover of more than 10 percent, or trees able to reach these thresholds in situ. It
does not include land that is predominantly under agricultural or urban land use”. More specifically:
• Forest is determined both by the presence of trees and the absence of other predominant land
uses. The trees should be able to reach a minimum height of 5 meters.
• It includes areas with young trees that have not yet reached but which are expected to reach a
canopy cover of at least 10 percent and tree height of 5 meters or more. It also includes areas
that are temporarily unstocked due to clear-cutting as part of a forest management practice or
natural disasters, and which are expected to be regenerated within 5 years. Local conditions
may, in exceptional cases, justify that a longer time frame is used.
• It includes forest roads, firebreaks and other small open areas; forest in national parks, nature
reserves and other protected areas such as those of specific environmental, scientific, historical,
cultural or spiritual interest.
• It includes windbreaks, shelterbelts and corridors of trees with an area of more than 0.5 hectares
and width of more than 20 meters.
• It includes abandoned shifting cultivation land with a regeneration of trees that have, or are
expected to reach, a canopy cover of at least 10 percent and tree height of at least 5 meters.
• It includes areas with mangroves in tidal zones, regardless of whether this area is classified as
land area or not.
• It includes rubberwood, cork oak and Christmas tree plantations.
• It includes areas with bamboo and palms provided that land use, height and canopy cover
criteria are met.
• It excludes tree stands in agricultural production systems, such as fruit tree plantations, oil palm
plantations, olive orchards and agroforestry systems when crops are grown under tree cover.
Note: Some agroforestry systems such as the “Taungya” system where crops are grown only
during the first years of the forest rotation should be classified as forest.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (25,'Land area','Land area is the country area excluding area under inland waters and coastal waters.
• Country area: Area under national sovereignty. It is the sum of land area, inland waters and
coastal waters. It excludes the exclusive economic zone.
• Inland waters: Areas corresponding to natural or artificial water courses, serving to drain natural
or artificial bodies of water, including lakes, reservoirs, rivers, brooks, streams, ponds, inland
canals, dams, and other land-locked waters. The banks constitute limits whether the water is
present or not.
• Coastal waters: Waters located in-between the land territory and the outer limit of the territorial
sea. They comprise ''''Internal waters'''' and ''''Territorial sea," and where applicable, ''''Archipelagic
waters."');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (26,'Undernourishment','Though strictly related, “undernourishment” as defined here is different from the physical conditions of
“malnutrition” and “undernutrition” as it refers to the condition of insufficient intake of food, rather than
to the outcome in terms of nutritional status. In French, Spanish and Italian the difference is marked by
the use of the terms alimentation, alimentación, or alimentazione, instead of nutrition, nutrición or
nutrizione, in the name of the indicator. A more appropriate expression in English that would render the
precise meaning of the indicator might have been “prevalence of under-feeding” but by now the term
“undernourishment” has long been associated with the indicator.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (27,'Food insecurity','Food insecurity is the state of being unable to consistently access or afford sufficient, safe, and nutritious food to meet basic dietary needs and support a healthy, active life.');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (28,'Renewable energy consumption','Renewable energy consumption includes consumption of energy derived from: hydro, wind, solar, solid
biofuels, liquid biofuels, biogas, geothermal, marine and renewable waste. Total final energy
consumption is calculated from balances as total final consumption minus non-energy use.
Comments regarding specific renewable energy sources:
• Solar energy includes solar PV and solar thermal.
• Liquid biofuels include biogasoline, biodiesels and other liquid biofuels.
• Solid biofuels include fuelwood, animal waste, vegetable waste, black liquor, bagasse and
charcoal.
• Renewable waste energy covers energy from renewable municipal waste');
INSERT INTO "key_concepts" ("concept_id","name","definition") VALUES (29,'Greenhouse gas emissions','Greenhouse gas emissions are the release of gases, such as carbon dioxide, methane, and nitrous oxide, into the atmosphere that trap heat and contribute to global warming and climate change.');
INSERT INTO "packages" ("package_id","name","definition") VALUES (1,'SME-Loop','The aim of the MSME Business Training and Coaching Loop (MSME Loop) is to enhance entrepreneurial competencies of business owners of existing micro, small and medium enterprises (MSME) to increase employment and income opportunities for poor people in rural and peri-urban areas. ');
INSERT INTO "packages" ("package_id","name","definition") VALUES (2,'Tracer studies','M&E standard package to learn how trainees have done 2 years after the training (found work or not, etc.))');
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
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (18,18);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (18,19);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (18,20);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (18,21);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (18,22);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (19,23);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (20,24);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (20,25);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (21,26);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (22,26);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (22,27);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (23,28);
INSERT INTO "indicator_concepts" ("indicator_id","concept_id") VALUES (17,29);
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
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (1,1,'Total number of jobs at enterprise (in FTEs)','Measures the total number of full-time equivalent positions in an enterprise.','FTEs','Gender, age, employment type','Enterprise surveys, administrative records','Providing financial and/or technical support to enterprises can lead to higher job creation.','8.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (2,2,'Turnover','Reflects the total sales revenue of an enterprise over a given period.','Currency (e.g., USD, EUR)','Sector, region','Financial reports, tax records','Increased turnover indicates improved business operations and market demand.','8.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (3,2,'Total number of enterprises with improved business operations management','Tracks the number of enterprises implementing better management practices.','Number','Sector, size of enterprise','Interviews, project reports','Improved business operations management boosts efficiency and profitability.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (4,3,'Total amount of problematic materials reduced in production of goods at enterprise','Measures the reduction of environmentally harmful materials used in production.','Tons','Material type','Enterprise self-reporting, audits','Reducing problematic materials improves sustainability and reduces environmental harm.','12.4','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (5,8,'Total amount of private capital mobilized from enterprise for investment in sustainable development','Tracks private investment contributions to sustainability initiatives.','Currency (e.g., USD, EUR)','Sector, type of investment','Financial records, surveys','Mobilizing private capital accelerates progress toward sustainable development.','17.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (6,5,'Total number of marginalized people benefiting from enterprise operations','Measures the number of marginalized individuals positively impacted by enterprise activities.','Number','Gender, age, group','Beneficiary surveys, reports','Supporting marginalized populations enhances social equity and inclusion.','10.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (7,8,'Access to financial services','Tracks the number of enterprises or individuals gaining access to financial products or services.','Number','Type of financial service, region','Surveys, administrative data','Improved access to financial services enables business growth and economic inclusion.','8','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (8,2,'New products and services','Measures the number of new products or services introduced by enterprises.','Number','Sector, type of product/service','Enterprise reports, market data','Innovation in products and services boosts market competitiveness and consumer satisfaction.','9.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (9,2,'Formalisation','Tracks the number of informal enterprises transitioning to formal status.','Number','Sector, region','Administrative records, enterprise surveys','Formalisation enhances access to markets, finance, and legal protections.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (10,2,'Profit (before tax)','Measures the total profit generated by an enterprise before tax deductions.','Currency (e.g., USD, EUR)','Sector, region','Financial reports, tax records','Profitability is a key indicator of business health and sustainability.','8.2','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (11,2,'Formalised business relationships','Measures the number of formalized contracts or partnerships established by an enterprise.','Number','Sector, region','Enterprise records, partnership agreements','Formalized relationships enhance business credibility and market access.','8.3','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (12,9,'Access to markets','Tracks the number of enterprises or individuals gaining access to local, regional, or international markets.','Number','Market type, region','Market surveys, enterprise reports','Access to markets enables business growth and economic opportunities.','8.a','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (13,1,'Jobs created','Measures the total number of jobs created through project interventions.','Number','Gender, age, employment type','Project reports, administrative data','Job creation contributes to economic growth and poverty reduction.','8.5','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (14,1,'Additional employment','Measures the number of additional employment opportunities created, beyond initial project goals.','Number','Gender, age, employment type','Enterprise surveys, payroll records','Additional employment strengthens workforce participation and economic stability.','8.5','You can find more information on this indicator here: https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf and here https://unstats.un.org/sdgs/metadata/?Goal=8&Target=8.5','TRUE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (15,5,'Higher income (entrepreneur/employees)','Tracks the increase in income for entrepreneurs and employees resulting from project support.','Currency (e.g., USD, EUR)','Gender, region, sector','Surveys, financial records','Higher income improves living standards and supports economic development.','10.1','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (16,9,'Improved working conditions','Measures improvements in workplace safety, facilities, and employment benefits.','Number','Type of improvement, region','Workplace audits, employee surveys','Improved working conditions enhance employee satisfaction and productivity.','8.8','https://agenda2030giz-guide.de/files/giz/Dokumente/Durchfuehrung/20019-giz-en-Orientation%20paper_Guidelines%20for%20monitoring%20and%20evaluation%20in%20the%20context%20of%202030%20Agenda.pdf','FALSE','Outcome');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (17,12,'Total greenhouse gas emissions per year','The ultimate objective of the Climate Change Convention (UNFCCC) is to achieve the stabilization of
greenhouse gas concentrations in the atmosphere at a level that would prevent dangerous
anthropogenic interference with the climate system. Estimating the levels of greenhouse gas (GHG)
emissions and removals is an important element of the efforts to achieve this objective','Mt CO2-equivalent','Countres; regions; industries','Country reporting','The ultimate objective of the Climate Change Convention (UNFCCC) is to achieve the stabilization of
greenhouse gas concentrations in the atmosphere at a level that would prevent dangerous
anthropogenic interference with the climate system. Estimating the levels of greenhouse gas (GHG)
emissions and removals is an important element of the efforts to achieve this objective.
In accordance with Articles 4 and 12 of the Climate Change Convention and the relevant decisions of the
Conference of the Parties, countries that are Parties to the Convention submit national GHG inventories
to the Climate Change secretariat. These submissions are made in accordance with the reporting
requirements adopted under the Convention, such as the revised “Guidelines for the preparation of
national communications by Parties included in Annex I to the Convention, Part I: UNFCCC reporting
guidelines on annual greenhouse gas inventories” (decision 24/CP.19) for Annex I Parties and “Guidelines
for the preparation of national communications for non-Annex I Parties” (decision 17/CP.8). The
inventory data are provided in the annual GHG inventory submissions by Annex I Parties and in the
national communications and biennial update reports by non-Annex I Parties.','13.2','https://unstats.un.org/sdgs/metadata/files/Metadata-13-02-02.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (18,11,'Number of deaths, missing persons and directly affected persons attributed to disasters per 100,000 population','This indicator measures the number of people who died, went missing or were directly affected by
disasters per 100,000 population.','Number of people','Countries; Regions','Country reporting (Sendai framework)','The Sendai Framework for Disaster Risk Reduction 2015-2030 was adopted by UN Member States in
March 2015 as a global policy of disaster risk reduction. Among the global targets, “Target A:
Substantially reduce global disaster mortality by 2030, aiming to lower average per 100,000 global
mortality between 2020-2030 compared with 2005-2015” and “Target B: Substantially reduce the
number of affected people globally by 2030, aiming to lower the average global figure per 100,000
between 2020-2030 compared with 2005-2015” will contribute to sustainable development and
strengthen economic, social, health and environmental resilience. The economic, environmental and
social perspectives would include poverty eradication, urban resilience, and climate change adaptation.','13.1','https://unstats.un.org/sdgs/metadata/files/Metadata-13-01-01.pdf','FALSE','Outcome');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (19,13,'Proportion of population with access to electricity','Proportion of population with access to electricity is the percentage of population with access to electricity.
SDG7 ensures access to affordable, reliable, sustainable and modern energy for all. Specifically, Indicator
7.1.1 refers to the proportion of population with access to electricity. This is expressed in percentage
figures and is disaggregated by total, urban and rural access rates per country, as well as by UN regional
and global classifications','Percent','Countries; regions; urban/rural; marginalized groups','If data sources have any information on electricity access, it is collected and analysed in line with the
previous trends and future projections of each country. Data validation is conducted by checking that the
figures are reflective of the ground level scenario as well as are in line with country populations, income
levels and electrification programs.','Access to electricity addresses major critical issues in all the dimensions of sustainable development. The
target has a wide range of social and economic impacts, including facilitating development of income
generating activities and lightening the burden of household tasks.
Under the global target of equal access to energy, SDG7.1.1 focuses specifically on electricity access
available to the global population. In order to gain a clear picture, access rates are only considered if the
primary source of lighting is the local electricity provider, solar systems, mini-grids and stand-alone
systems. Sources such as generators, candles, batteries, etc., are not considered due to their limited
working capacities and since they are usually kept as backup sources for lighting.','7.1','https://unstats.un.org/sdgs/metadata/files/Metadata-07-01-01.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (20,14,'Forest area as a proportion of total land area','Data on Forest area are collected by FAO through the Global Forest Resources Assessment (FRA). This
assessment has been carried out at regular intervals since 1946 and are now produced every five year.
The latest of these assessments, FRA 2020, contains information for 236 countries and territories on
about 60 variables related to the extent of forests, their conditions, uses and values for several points in
time','Percent (%)','Countries; regions','Officially nominated national correspondents and their teams prepare the country reports for the Global
Forest Resources Assessment. Some countries prepare more than one report as they also report on
dependent territories. For the remaining countries and territories where no information is provided, a
report is prepared by FAO using existing information, literature search, remote sensing or a combination
of two or more of them','Forests fulfil a number of functions that are vital for humanity, including the provision of goods (wood
and non-wood forest products) and services such as habitats for biodiversity, carbon sequestration,
coastal protection and soil and water conservation.
The indicator provides a measure of the relative extent of forest in a country. The availability of accurate
data on a country''s forest area is a key element for forest policy and planning within the context of
sustainable development.
Changes in forest area reflect the demand for land for other uses and may help identify unsustainable
practices in the forestry and agricultural sector.
Forest area as percentage of total land area may be used as a rough proxy for the extent to which the
forests in a country are being conserved or restored, but it is only partly a measure for the extent to
which they are sustainably managed.
The indicator was included among the indicators for the Millennium Development Goals (MDG indicator
7.1 “Proportion of land covered by forest”).','15.1','Details of the SDG indicator 15.1.1 are to be found here: https://unstats.un.org/sdgs/metadata/files/Metadata-15-01-01.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (21,15,'Prevalence of undernourishment ','Prevalence of undernourishment ','Percentage','Urban / rural ; regions','Official information on food commodity production, trade and utilization used by FAO to compile Food
Balance Sheets is provided mainly by Statistical Units of the Ministry of Agriculture. FAO sends out a data
collection questionnaire every year to an identified focal point.','The indicator has been used by FAO to monitor the World Food Summit Target and the MDG Target 1C,
at national, regional and global level, since 1999. It allows monitoring trends in the extent of dietary
energy inadequacy in a population over time, generated as a result of the combination of changes in the
overall availability of food, in the households’ ability to access it, and in the socio-demographic
characteristics of the population, as well as differences across countries and regions in any given moment
in time.
The parametric approach adopted by FAO allows obtaining reliable estimated for relatively large
population groups. As it reflects a severe condition of lack of food, it is fully consistent with the spirit of a
Goal that aims at reducing hunger.','2.1','See here: https://unstats.un.org/sdgs/metadata/files/Metadata-02-01-01.pdf','FALSE','Outcome');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (22,15,'Prevalence of moderate or severe food insecurity in the population, based on the Food
Insecurity Experience Scale (FIES)','The indicator measures the percentage of individuals in the population who have experienced food
insecurity at moderate or severe levels during the reference period. The severity of food insecurity,
defined as a latent trait, is measured on the Food Insecurity Experience Scale global reference scale, a measurement standard established by FAO through the application of the Food Insecurity Experience
Scale in more than 140 countries worldwide, starting in 2014','Prevalence of food insecurity: Percent (%)
Number of food insecure people: Millions (of people)','As the FIES or any other compatible experience-based food security questionnaire is applied through
surveys, the prevalence of food insecurity can be measured in any population group for which the survey
used to collect data is representative.
If applied at household level, disaggregation is thus possible based on household characteristics such as
location, household income, composition (including for example presence and number of small children,
members with disabilities, elderly members, etc.), sex, age and education of the household head, etc. If
applied at the individual level, proper disaggregation of the prevalence of food insecurity by sex is
possible as the prevalence of food insecurity among male and among female members of the same
population group can be measured independently','Face-to-face and telephone interviews within national surveys.','Food insecurity at moderate levels of severity is typically associated with the inability to regularly eat
healthy, balanced diets. As such, high prevalence of food insecurity at moderate levels can be considered
a predictor of various forms of diet-related health conditions in the population, associated with
micronutrient deficiency and unbalanced diets. Severe levels of food insecurity, on the other hand, imply
a high probability of reduced food intake and therefore can lead to more severe forms of undernutrition,
including hunger.
Short questionnaires like the FIES are very easy to administer at limited cost, which is one of the main
advantages of their use. The ability to precisely determine the food insecurity status of specific
individuals or households, however, is limited by the small number of questions, a reason why
assignment of individual respondents to food insecurity classes is best done in probability terms, thus
ensuring that estimates of prevalence rates in a population are sufficiently reliable even when based on
relatively small sample sizes.
As with any statistical assessment, reliability and precision crucially depend on the quality of the survey
design and implementation. One major advantage of the analytic treatment of the data through the
Rasch model-based methods is that it permits testing the quality of the data collected and evaluating the
likely margin of uncertainty around estimated prevalence rates, which should always be reported.','2.1','https://unstats.un.org/sdgs/metadata/files/Metadata-02-01-02.pdf','FALSE','Output');
INSERT INTO "indicators" ("indicator_id","theme_id","name","definition","unit_of_measurement","disaggregation","data_collection_method","underlying_theory_of_change","sdg_id","additional_info","is_standard","indicator_level") VALUES (23,13,'Renewable energy share in the total final energy consumption ','The renewable energy share in total final consumption is the percentage of final consumption of energy
that is derived from renewable resources.','Percentage','By resource; by production-sector; by end-use sector','The IEA collects energy data at the national level according to harmonised international definitions and
questionnaires, as described in the UN International Recommendations for Energy Statistics
(unstats.un.org/unsd/energystats/methodology/ires/).
UNSD also collects energy statistics from countries according to the same harmonised methodology','The target “By 2030, increase substantially the share of renewable energy in the global energy mix”
impacts all three dimensions of sustainable development. Renewable energy technologies represent a
major element in strategies for greening economies everywhere in the world and for tackling the critical
global problem of climate change. A number of definitions of renewable energy exist; what they have in
common is highlighting as renewable all forms of energy that their consumption does not deplete their
availability in the future. These include solar, wind, ocean, hydropower, geothermal sources, and
bioenergy (in the case of bioenergy, which can be depleted, sources of bioenergy can be replaced within
a short to medium-term frame). Importantly, this indicator focuses on the amount of renewable energy
actually consumed rather than the capacity for renewable energy production, which cannot always be
fully utilized. By focusing on consumption by the end user, it avoids the distortions caused by the fact
that conventional energy sources are subject to significant energy losses along the production chain','7.2','https://unstats.un.org/sdgs/metadata/files/Metadata-07-02-01.pdf','FALSE','Output');
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
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (11,'Climate change adaptation','Adjusting systems, practices, and infrastructure to minimize harm or maximize benefits from the impacts of climate change.',1);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (12,'Climate change mitigation','Actions taken to reduce or prevent the emission of greenhouse gases, thereby limiting the extent of future climate change.',1);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (13,'Access to energy','Ensure universal access to affordable, reliable and modern energy services',7);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (14,'Land cover','Land cover refers to the physical material on the surface of the Earth, such as vegetation, urban infrastructure, water, bare soil, and other natural or human-made features.',1);
INSERT INTO "themes" ("theme_id","name","description","sector_id") VALUES (15,'Food security','Food security is the state in which all people, at all times, have physical, social, and economic access to sufficient, safe, and nutritious food to meet their dietary needs and preferences for an active and healthy life.',4);
COMMIT;
