import { CodegenConfig } from '@graphql-codegen/cli';
import fs from 'fs';
console.log(`Dart  successfully `);


function convertTypeScriptToDart(code: string): string {
  // Replace TypeScript-specific syntax with Dart equivalent
  let convertedCode = code;

  // Replace scalar types
  convertedCode = convertedCode.replace(/Scalars\['(\w+)'\]\['output'\]/g, '$1');
  convertedCode = convertedCode.replace(/Scalars\['(\w+)'\]\['input'\]/g, '$1');

  // Replace object types
  convertedCode = convertedCode.replace(/AddAnnualPlanDto/g, 'AddAnnualPlanDTO');
  convertedCode = convertedCode.replace(/AddAnnualPlansResponse/g, 'AddAnnualPlansResponse');
  convertedCode = convertedCode.replace(/AddCheckupMasterDto/g, 'AddCheckupMasterDto');

  // Replace nullable types
  convertedCode = convertedCode.replace(/Maybe<(\w+)?>/g, '$1?');

  // Replace array types
  convertedCode = convertedCode.replace(/Array<Maybe<(\w+)>>/g, 'List<$1?>');
  convertedCode = convertedCode.replace(/Array<(\w+)>/g, 'List<$1>');

  return convertedCode;
}


function writeDartCodeToFile(path: string, code: string): void {
  fs.writeFile(path, code, (err) => {
    if (err) {
      console.error(`Error writing Dart code to file: ${err}`);
    } else {
      console.log(`Dart code successfully written to file: ${path}`);
    }
  });
}

export { writeDartCodeToFile };

const config: CodegenConfig = {
  overwrite: true,
  schema: [
    {
      'https://logsiru-dev.practechs.com/api-dev/graphql': {
        headers: {
          Authorization: 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ2VldJcm5IcG9IelVhMTNxVmpCTjNHd2JaQllyMWdkMWYxYWRrSHJtQlVRIn0.eyJleHAiOjE2ODc0NjU4MzMsImlhdCI6MTY4NzQyOTgzMywianRpIjoiNDZlZTk4NjQtMmViNC00OGM5LTllNmEtNTUyZmEzYTkyZTMxIiwiaXNzIjoiaHR0cDovL2xvZ3NpcnUtZGV2LnByYWN0ZWNocy5jb206ODA5MC9yZWFsbXMvcGh0LWRldiIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiIxYTE5ZTFkYS04YmM2LTQ5NGEtYjVhYS03YWQ3NzY3NTYzZDciLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJwaHQtZGV2LWF1dGgiLCJzZXNzaW9uX3N0YXRlIjoiMjI2NjkwZjctOTU5Mi00NmViLTg3MDEtMGM5MWFkMjlhMzg1IiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJURVNUX0lURU1fQ0FURUdPUllfVklFVyIsIk1FRVRJTkdfTUlOVVRFU19ERUxFVEUiLCJkZWZhdWx0LXJvbGVzLXBodC1kZXYiLCJFTVBMT1lFRV9JTkZPUk1BVElPTl9DUkVBVEVfRURJVCIsIlVTRVJfVklFVyIsIkVNUExPWUVFX0NSRUFURSIsIlNUUkVTU19DSEVDS19DUkVBVEVfRURJVCIsIlRFU1RfSVRFTV9DQVRFR09SWV9ERUxFVEUiLCJNRUVUSU5HX01JTlVURVNfVVBEQVRFIiwiVEVTVF9JVEVNX0NBVEVHT1JZX1VQREFURSIsIkVNUExPWUVFX0lOVEVSVklFV19ISVNUT1JZX1ZJRVciLCJTVFJFU1NfQ0hFQ0tfSElHSF9TVFJFU1NfRU1QTE9ZRUVfVklFVyIsIlNUUkVTU19URVNUX1JFU1VMVF9WSUVXIiwiQ09NUEFOWV9DUkVBVEUiLCJJTlRFUlZJRVdfQ1JFQVRFIiwiRU1QTE9ZRUVfVklFVyIsIlVTRVJfR1JPVVBfVklFVyIsIk1FRElDQUxfQ0hFQ0tVUF9TUEVDSUFMX1ZJRVciLCJQRVJNSVNTSU9OX0dST1VQX0NSRUFURSIsIk1FRElDQUxfQ0hFQ0tVUF9MRUdBTF9JVEVNX1ZJRVciLCJDTElOSUNfVVBEQVRFIiwiTUVESUNBTF9DSEVDS1VQX1ZJRVciLCJTVFJFU1NfVEVTVF9SRVNVTFRfVVBEQVRFIiwiQU5OVUFMX1BMQU5fQ1JFQVRFIiwiQ0xJTklDX0RFTEVURSIsIkhFQUxUSF9DT01NSVRURUVfVklFVyIsIlNUUkVTU19URVNUX1RFTVBMQVRFX1ZJRVciLCJTVFJFU1NfVEVTVF9URU1QTEFURV9ERUxFVEUiLCJSRVNFUlZBVElPTl9ERUxFVEUiLCJNRURJQ0FMX0NIRUNLVVBfTUFTVEVSX0RFTEVURSIsIlVTRVJfREVMRVRFIiwiUEVSTUlTU0lPTl9HUk9VUF9ERUxFVEUiLCJTVFJFU1NfVEVTVF9SRVNVTFRfREVMRVRFIiwiU0VUVElOR1NfUkVUSVJFRF9MSVNUX1ZJRVciLCJFTVBMT1lFRV9VUERBVEUiLCJTRVRUSU5HU19ST0xFX0VESVQiLCJURVNUX0lURU1fTUFTVEVSX0RFTEVURSIsIk1FRElDQUxfQ0hFQ0tVUF9NQVNURVJfVklFVyIsIkNMSU5JQ19WSUVXIiwiTUVFVElOR19NSU5VVEVTX1ZJRVciLCJBTk5VQUxfUExBTl9VUERBVEUiLCJBTk5VQUxfUExBTl9ERUxFVEUiLCJDT01QQU5ZX1VQREFURSIsIlNFVFRJTkdTX01FRElDQUxfQ0hFQ0tVUF9FRElUIiwiQ0xJTklDX0NSRUFURSIsIlVTRVJfQ1JFQVRFIiwiVEVTVF9JVEVNX01BU1RFUl9WSUVXIiwiU1RSRVNTX1RFU1RfUVVFU1RJT05OQUlSRV9WSUVXIiwiVVNFUl9HUk9VUF9ERUxFVEUiLCJVU0VSX0dST1VQX1VQREFURSIsIlJFU0VSVkFUSU9OX0NSRUFURSIsIk1FRElDQUxfQ0hFQ0tVUF9NQVNURVJfQ1JFQVRFIiwiSU5URVJWSUVXX1VQREFURSIsIkNPTVBBTllfVklFVyIsIlRFU1RfSVRFTV9DQVRFR09SWV9DUkVBVEUiLCJTVU1NRVJZX1ZJRVciLCJPVkVSX1dPUktfVklFVyIsIklOVEVSVklFV19ERUxFVEUiLCJDT01QQU5ZX0RFTEVURSIsIlNUUkVTU19DSEVDS19QRVJTT05BTF9BTkFMWVNJU19WSUVXIiwiTUVESUNBTF9DSEVDS1VQX01BU1RFUl9VUERBVEUiLCJSRVNFUlZBVElPTl9VUERBVEUiLCJVU0VSX1VQREFURSIsIlNUUkVTU19URVNUX1RFTVBMQVRFX1VQREFURSIsIkZVTExfQk9EWV9DSEVDS1VQX1ZJRVciLCJNRURJQ0FMX0NIRUNLVVBfUkVTVUxUX1ZJRVciLCJPVkVSX1dPUktfQ1JFQVRFIiwiRU1QTE9ZRUVfREVMRVRFIiwiTUVFVElOR19NSU5VVEVTX0NSRUFURSIsIlRFU1RfSVRFTV9NQVNURVJfVVBEQVRFIiwiUEVSTUlTU0lPTl9HUk9VUF9VUERBVEUiLCJSRVNFUlZBVElPTl9WSUVXIiwiT1ZFUldPUktfUklTS19WSUVXIiwiU1RSRVNTX1RFU1RfVEVNUExBVEVfQ1JFQVRFIiwiTUVESUNBTF9DSEVDS1VQX0NSRUFURSIsIlRFU1RfSVRFTV9NQVNURVJfQ1JFQVRFIiwiRklMRV9DUkVBVEUiLCJJTlRFUlZJRVdfVklFVyIsIkFOTlVBTF9QTEFOX1ZJRVciLCJQRVJNSVNTSU9OX0dST1VQX1ZJRVciLCJTVFJFU1NfVEVTVF9SRVNVTFRfQ1JFQVRFIiwiVVNFUl9HUk9VUF9DUkVBVEUiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6InByb2ZpbGUgZW1haWwiLCJzaWQiOiIyMjY2OTBmNy05NTkyLTQ2ZWItODcwMS0wYzkxYWQyOWEzODUiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6ImFwcCB1c2VyIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYXBwdXNlckBnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiYXBwIiwiZmFtaWx5X25hbWUiOiJ1c2VyIiwiZW1haWwiOiJhcHB1c2VyQGdtYWlsLmNvbSJ9.tdR3Sd8V_U3eVC2FwGrJtFV88fyTGZXvvd_GsKg2jYtwq-dHuNfD1alat8xnkz5_p913oY2h1dmmyMLv6Pc3DwADB7vGSfETgltkgCWAUFYHd735krkVPQ3pbcQWpS4cyhrmM7W3J-pmO_8BN5fpwsDsbOLGBFu84VMsVuE6vVI_W9l48rTVc_-i6hxQzImr95saDBeiVAQjSzpm3KLxA1YTXihButfv5xnlLnyQGr4IGTRileZ5-TDzaX0BXlE_hmAODUpwWaIWZzWh8ry6PLc7-91kPZ_zn13inGXRqzAUwNFtoGPmUiAZzHs5cr3Ta6dAszkPbw64LBxZSFFAIw',
        },
      },
    },
  ],
  documents: './lib/graphql/**/!(*.generated).{ts,dart,gql}',
  ignoreNoDocuments: true,
  generates: {
    './lib/data/type.ts': {
      plugins: ['flutter-freezed'],
      config: {
        namingConvention: {
          enumValues: '',
        },
      },
    },
    './lib/graphql/': {
      preset: 'near-operation-file',
      presetConfig: {
        extension: '.generated.dart',
        baseTypesPath: './lib/data/type.ts',
      },
      plugins: [
        'flutter-freezed',
      ],
      config: {
        withHooks: true,
        withHOC: true,
        withComponent: true,
        noHOCGraphQLTag: true,
        noGraphQLTag: true,
      },
    },
  },
  config: {
    typescriptApolloAngular: {
      onlyOperationTypes: true, // Include only operation types (query, mutation, subscription)
    },
  },
};

export default config;




