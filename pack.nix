{lib, buildPythonPackage, pytestCheckHook, numpy, matplotlib, pythonOlder, rustPlatform, maturin}:

buildPythonPackage rec {
	pname = "bergsf";
	format = "pyproject";
	version = "0.1.0";
	cargoDeps = rustPlatform.importCargoLock {
		lockFile = ./Cargo.lock;
	};
	# build-system = [pgs.maturin];
	propagetedBuildInputs = [maturin numpy matplotlib];
	dependencies = [numpy matplotlib];
	nativeBuildInputs = with rustPlatform; [
	    cargoSetupHook
	    maturinBuildHook
	  ];
	#src = "${crateWheel}/${wheelName}";
	src = ./.;
	doCheck = false;
	pythonImportsCheck = [ pname ];
}
