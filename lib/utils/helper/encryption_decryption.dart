import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms
  static Encrypted? encrypted;
  static var decrypted;
  static encryptAES(plainText) {
    final key = Key.fromUtf8(EncryptionKeys.encryptionKey);
    final iv = IV.fromBase64(EncryptionKeys.encryptionIV);
    final encrypter = Encrypter(AES(
      key,
    ));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted!.base64;
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8(EncryptionKeys.encryptionKey);
    final iv = IV.fromBase64(EncryptionKeys.encryptionIV);
    final encrypter = Encrypter(AES(
      key,
    ));
    decrypted = encrypter.decrypt64(plainText, iv: iv);
    return decrypted;
  }
}

class EncryptionKeys {
  static const encryptionKey = "QesFaDuc17KKROxfLgLEFQ==";
  static const encryptionIV = "V2D1fTz+H2Co/NSSeqtwWQ==";
}
