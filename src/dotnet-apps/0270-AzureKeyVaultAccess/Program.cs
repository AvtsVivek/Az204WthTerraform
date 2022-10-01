using Azure.Identity;
using Azure.Security.KeyVault.Keys;
using Azure.Security.KeyVault.Keys.Cryptography;
using System.Text;

var tenantId = "46b02288-c094-50c5-3cb3-1168c454d83g";
var clientId = "d85236a6-410f-4ca6-a380-31205aaa6197";
var clientSecret = "kRI8Q~QftrmhcSr~Q0_vXxQ4LlZ56~qsqiK6SaAp";

var keyvaultUrl = "https://vivek-cxvoys-my-rg.vault.azure.net/";
var keyName = "generated-certificate";
var textToEncrypt = "This a secret text";

var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);

var keyClient = new KeyClient(new Uri(keyvaultUrl), clientSecretCredential);

var key = keyClient.GetKey(keyName);

// The CryptographyClient class is part of the Azure Key vault package
// This is used to perform cryptographic operations with Azure Key Vault keys
var cryptoClient = new CryptographyClient(key.Value.Id, clientSecretCredential);

// We first need to take the bytes of the string that needs to be converted

var textToByteArray = Encoding.UTF8.GetBytes(textToEncrypt);

var result = cryptoClient.Encrypt(EncryptionAlgorithm.RsaOaep, textToByteArray);

Console.WriteLine("The encrypted text");
Console.WriteLine(Convert.ToBase64String(result.Ciphertext));

// Now lets decrypt the text
// We first need to convert our Base 64 string of the Cipertext to bytes

byte[] ciperToBytes = result.Ciphertext;

var textDecrypted = cryptoClient.Decrypt(EncryptionAlgorithm.RsaOaep, ciperToBytes);

Console.WriteLine(Encoding.UTF8.GetString(textDecrypted.Plaintext));

Console.ForegroundColor = ConsoleColor.DarkGreen;
Console.WriteLine("Execution Completed successifully!!");

