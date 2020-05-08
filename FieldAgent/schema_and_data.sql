drop database if exists field_agent;

create database field_agent;

use field_agent;

create table agency (
	agency_id int primary key auto_increment,
    `name` varchar(100) not null
);

create table security_clearance (
	security_clearance_id int primary key auto_increment,
    `name` varchar(50) not null
);

create table country (
	country_code char(3) primary key,
    `name` varchar(100) not null
);

create table agent (
	identifier varchar(25) primary key,
    first_name varchar(25) not null,
    middle_name varchar(25) null,
    last_name varchar(25) not null,
    picture_url varchar(255) null,
    birth_date date not null,
    height int not null,
    activation_date date not null,
    is_active boolean not null default true,
    agency_id int not null,
    security_clearance_id int not null,
    constraint fk_agent_agency
	  foreign key (agency_id)
      references agency(agency_id),
    constraint fk_agent_security_clearance
      foreign key (security_clearance_id)
      references security_clearance(security_clearance_id)
);

create table assignment (
	assignment_id int primary key auto_increment,
    identifier varchar(25) not null,
    country_code char(3) not null,
    start_date date not null,
    projected_end_date date not null,
    actual_end_date date null,
    notes text null,
    constraint fk_assignment_agent
      foreign key (identifier)
      references agent(identifier),
	constraint fk_assignment_country
     foreign key (country_code)
     references country(country_code)
);

insert into agency(agency_id, `name`) 
	values
	(1, 'CIA'),
    (2, 'FBU'),
    (3, 'NSA'),
    (4, 'Homeland Security'),
    (5, 'Defense Intelligence Agency'),
    (6, 'Southern Reach'),
    (7, 'CONTROL'),
    (8, 'ODIN'),
    (9, 'Special Forces');
    
insert into security_clearance(security_clearance_id, `name`) 
	values
	(1, 'Confidential'),
	(2, 'Secret'),
	(3, 'Top Secret'),
	(4, 'Dark Matter');
    
insert into country(country_code, `name`)
	values    
('AND','Andorra'),
('ARE','United Arab Emirates'),
('AFG','Afghanistan'),
('ATG','Antigua and Barbuda'),
('AIA','Anguilla'),
('ALB','Albania'),
('ARM','Armenia'),
('AGO','Angola'),
('ATA','Antarctica'),
('ARG','Argentina'),
('ASM','American Samoa'),
('AUT','Austria'),
('AUS','Australia'),
('ABW','Aruba'),
('ALA','Åland Islands'),
('AZE','Azerbaijan'),
('BIH','Bosnia and Herzegovina'),
('BRB','Barbados'),
('BGD','Bangladesh'),
('BEL','Belgium'),
('BFA','Burkina Faso'),
('BGR','Bulgaria'),
('BHR','Bahrain'),
('BDI','Burundi'),
('BEN','Benin'),
('BLM','Saint Barthélemy'),
('BMU','Bermuda'),
('BRN','Brunei Darussalam'),
('BOL','Bolivia (Plurinational State of)'),
('BES','Bonaire, Sint Eustatius and Saba'),
('BRA','Brazil'),
('BHS','Bahamas'),
('BTN','Bhutan'),
('BVT','Bouvet Island'),
('BWA','Botswana'),
('BLR','Belarus'),
('BLZ','Belize'),
('CAN','Canada'),
('CCK','Cocos (Keeling) Islands'),
('COD','Congo, Democratic Republic of the'),
('CAF','Central African Republic'),
('COG','Congo'),
('CHE','Switzerland'),
('CIV','Côte d''Ivoire'),
('COK','Cook Islands'),
('CHL','Chile'),
('CMR','Cameroon'),
('CHN','China'),
('COL','Colombia'),
('CRI','Costa Rica'),
('CUB','Cuba'),
('CPV','Cabo Verde'),
('CUW','Curaçao'),
('CXR','Christmas Island'),
('CYP','Cyprus'),
('CZE','Czechia'),
('DEU','Germany'),
('DJI','Djibouti'),
('DNK','Denmark'),
('DMA','Dominica'),
('DOM','Dominican Republic'),
('DZA','Algeria'),
('ECU','Ecuador'),
('EST','Estonia'),
('EGY','Egypt'),
('ESH','Western Sahara'),
('ERI','Eritrea'),
('ESP','Spain'),
('ETH','Ethiopia'),
('FIN','Finland'),
('FJI','Fiji'),
('FLK','Falkland Islands (Malvinas)'),
('FSM','Micronesia (Federated States of)'),
('FRO','Faroe Islands'),
('FRA','France'),
('GAB','Gabon'),
('GBR','United Kingdom of Great Britain and Northern Ireland'),
('GRD','Grenada'),
('GEO','Georgia'),
('GUF','French Guiana'),
('GGY','Guernsey'),
('GHA','Ghana'),
('GIB','Gibraltar'),
('GRL','Greenland'),
('GMB','Gambia'),
('GIN','Guinea'),
('GLP','Guadeloupe'),
('GNQ','Equatorial Guinea'),
('GRC','Greece'),
('SGS','South Georgia and the South Sandwich Islands'),
('GTM','Guatemala'),
('GUM','Guam'),
('GNB','Guinea-Bissau'),
('GUY','Guyana'),
('HKG','Hong Kong'),
('HMD','Heard Island and McDonald Islands'),
('HND','Honduras'),
('HRV','Croatia'),
('HTI','Haiti'),
('HUN','Hungary'),
('IDN','Indonesia'),
('IRL','Ireland'),
('ISR','Israel'),
('IMN','Isle of Man'),
('IND','India'),
('IOT','British Indian Ocean Territory'),
('IRQ','Iraq'),
('IRN','Iran (Islamic Republic of)'),
('ISL','Iceland'),
('ITA','Italy'),
('JEY','Jersey'),
('JAM','Jamaica'),
('JOR','Jordan'),
('JPN','Japan'),
('KEN','Kenya'),
('KGZ','Kyrgyzstan'),
('KHM','Cambodia'),
('KIR','Kiribati'),
('COM','Comoros'),
('KNA','Saint Kitts and Nevis'),
('PRK','Korea (Democratic People''s Republic of)'),
('KOR','Korea, Republic of'),
('KWT','Kuwait'),
('CYM','Cayman Islands'),
('KAZ','Kazakhstan'),
('LAO','Lao People''s Democratic Republic'),
('LBN','Lebanon'),
('LCA','Saint Lucia'),
('LIE','Liechtenstein'),
('LKA','Sri Lanka'),
('LBR','Liberia'),
('LSO','Lesotho'),
('LTU','Lithuania'),
('LUX','Luxembourg'),
('LVA','Latvia'),
('LBY','Libya'),
('MAR','Morocco'),
('MCO','Monaco'),
('MDA','Moldova, Republic of'),
('MNE','Montenegro'),
('MAF','Saint Martin (French part)'),
('MDG','Madagascar'),
('MHL','Marshall Islands'),
('MKD','North Macedonia'),
('MLI','Mali'),
('MMR','Myanmar'),
('MNG','Mongolia'),
('MAC','Macao'),
('MNP','Northern Mariana Islands'),
('MTQ','Martinique'),
('MRT','Mauritania'),
('MSR','Montserrat'),
('MLT','Malta'),
('MUS','Mauritius'),
('MDV','Maldives'),
('MWI','Malawi'),
('MEX','Mexico'),
('MYS','Malaysia'),
('MOZ','Mozambique'),
('NAM','Namibia'),
('NCL','New Caledonia'),
('NER','Niger'),
('NFK','Norfolk Island'),
('NGA','Nigeria'),
('NIC','Nicaragua'),
('NLD','Netherlands'),
('NOR','Norway'),
('NPL','Nepal'),
('NRU','Nauru'),
('NIU','Niue'),
('NZL','New Zealand'),
('OMN','Oman'),
('PAN','Panama'),
('PER','Peru'),
('PYF','French Polynesia'),
('PNG','Papua New Guinea'),
('PHL','Philippines'),
('PAK','Pakistan'),
('POL','Poland'),
('SPM','Saint Pierre and Miquelon'),
('PCN','Pitcairn'),
('PRI','Puerto Rico'),
('PSE','Palestine, State of'),
('PRT','Portugal'),
('PLW','Palau'),
('PRY','Paraguay'),
('QAT','Qatar'),
('REU','Réunion'),
('ROU','Romania'),
('SRB','Serbia'),
('RUS','Russian Federation'),
('RWA','Rwanda'),
('SAU','Saudi Arabia'),
('SLB','Solomon Islands'),
('SYC','Seychelles'),
('SDN','Sudan'),
('SWE','Sweden'),
('SGP','Singapore'),
('SHN','Saint Helena, Ascension and Tristan da Cunha'),
('SVN','Slovenia'),
('SJM','Svalbard and Jan Mayen'),
('SVK','Slovakia'),
('SLE','Sierra Leone'),
('SMR','San Marino'),
('SEN','Senegal'),
('SOM','Somalia'),
('SUR','Suriname'),
('SSD','South Sudan'),
('STP','Sao Tome and Principe'),
('SLV','El Salvador'),
('SXM','Sint Maarten (Dutch part)'),
('SYR','Syrian Arab Republic'),
('SWZ','Eswatini'),
('TCA','Turks and Caicos Islands'),
('TCD','Chad'),
('ATF','French Southern Territories'),
('TGO','Togo'),
('THA','Thailand'),
('TJK','Tajikistan'),
('TKL','Tokelau'),
('TLS','Timor-Leste'),
('TKM','Turkmenistan'),
('TUN','Tunisia'),
('TON','Tonga'),
('TUR','Turkey'),
('TTO','Trinidad and Tobago'),
('TUV','Tuvalu'),
('TWN','Taiwan, Province of China[a]'),
('TZA','Tanzania, United Republic of'),
('UKR','Ukraine'),
('UGA','Uganda'),
('UMI','United States Minor Outlying Islands'),
('USA','United States of America'),
('URY','Uruguay'),
('UZB','Uzbekistan'),
('VAT','Holy See'),
('VCT','Saint Vincent and the Grenadines'),
('VEN','Venezuela (Bolivarian Republic of)'),
('VGB','Virgin Islands (British)'),
('VIR','Virgin Islands (U.S.)'),
('VNM','Viet Nam'),
('VUT','Vanuatu'),
('WLF','Wallis and Futuna'),
('WSM','Samoa'),
('YEM','Yemen'),
('MYT','Mayotte'),
('ZAF','South Africa'),
('ZMB','Zambia'),
('ZWE','Zimbabwe');
    
insert into agent(
	identifier,
	first_name,
	last_name,
	birth_date,
	height,
	activation_date,
	agency_id,
	security_clearance_id
) values (
	'SR-475-4PRAL',
	'Rowan',
	'MacAllan',
	'1995-04-12',
	72,
	'2015-03-15',
	6,
	3
);

insert into assignment (
	identifier,
	country_code,
	start_date,
	projected_end_date,   
	notes
) values 
	('SR-475-4PRAL', 'VNM', '2020-01-12', '2020-03-12', 'Vietnam'),
    ('SR-475-4PRAL', 'UKR', '2020-03-12', '2020-06-20', 'Then to Ukraine'),
    ('SR-475-4PRAL', 'MDV', '2020-06-20', '2020-12-31', 'End of year mission');

