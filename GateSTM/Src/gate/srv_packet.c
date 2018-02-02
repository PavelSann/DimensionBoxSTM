// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

//
//inline TRANSPackage PACK_NewPackage(TRANSAddress sourceAddress, TRANSAddress targetAddress, TRANSPackageType type) {
//	TRANSPackage package = {
//		.magicMark = TRANS_PACKAGE_MAGIC,
//		.sourceAddress = sourceAddress,
//		.targetAddress = targetAddress,
//		.type = type,
//		._reserv = 0,
//		.crc = TRANS_PACKAGE_CRC_DEFAULT
//	};
//	return package;
//}