/* Quartus Prime Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("/home/jose/QuartusProjects/Proyecto2/output_files/") File("Proyecto2.sof") MfrSpec(OpMask(1));
	P ActionCode(Ign)
		Device PartName(5CSEMA5F31) MfrSpec(OpMask(0));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
