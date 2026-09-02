// File: lib/resources/datasent_repository.dart

import 'package:bridgeinsp_new/drainage/Drmodels/drpost_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../notification/services/notification_service.dart';

final Uuid uuid = const Uuid();

abstract class PostingRepository {
  Future<AlertDialog> senddetaillist(DRPostModel pibridge);
}

class DRDatasendRepos extends PostingRepository {
  final Dio _dio = Dio();

  @override
  Future<AlertDialog> senddetaillist(DRPostModel gidrainage) async {
    debugPrint("repository reachable");

    final String newid = uuid.v4();

    final response = await _dio.post(
      "https://c751d51c-8449-4784-b592-f904983ea9b0.mock.pstmn.io",
      data: {
        "id": newid,
        "drainageid": gidrainage.id ?? "",
        "dateofinspection": "2023-09-21T02:00:50.069Z",
        "dateoflastinspection": "2023-09-21T02:00:50.069Z",
        "inspectedby": gidrainage.inspectedby ?? "",

        "siltation_diameter_inlet": gidrainage.siltationdiameterinlet ?? "",
        "siltation_diameter_outlet": gidrainage.siltationdiameteroutlet ?? "",
        "vege_cover_inlet": gidrainage.vegecoverinlet ?? "",
        "vege_cover_outlet": gidrainage.vegecoveroutlet ?? "",
        "headwall_status_inlet": gidrainage.headwallstatusinlet ?? "",
        "headwall_explanation_inlet": gidrainage.headwallexplainationinlet ?? "",
        "headwall_status_outlet": gidrainage.headwallstatusoutlet ?? "",
        "headwall_explanation_outlet": gidrainage.headwallexplainationoutlet ?? "",
        "wingwall_status_inlet": gidrainage.wingwallstatusinlet ?? "",
        "wingwall_explanation_inlet": gidrainage.wingwallexplanationinlet ?? "",
        "wingwall_status_outlet": gidrainage.wingwallstatusoutlet ?? "",
        "wingwall_explanation_outlet": gidrainage.wingwallexplanationoutlet ?? "",
        "sump_status_inlet": gidrainage.sumpstatusinlet ?? "",
        "sump_explanation_inlet": gidrainage.sumpexplanationinlet ?? "",
        "sump_status_outlet": gidrainage.sumpstatusoutlet ?? "",
        "sump_explanation_outlet": gidrainage.sumpexplanationoutlet ?? "",
        "apron_status_inlet": gidrainage.apronstatusinlet ?? "",
        "apron_explanation_inlet": gidrainage.apronexplanationinlet ?? "",
        "apron_status_outlet": gidrainage.apronstatusoutlet ?? "",
        "apron_explanation_outlet": gidrainage.apronexplanationoutlet ?? "",
        "incdrain_status_inlet": gidrainage.incdrainstatusinlet ?? "",
        "incdrain_explanation_inlet": gidrainage.incdrainexplanationinlet ?? "",
        "incdrain_status_outlet": gidrainage.incdrainstatusoutlet ?? "",
        "incdrain_explanation_outlet": gidrainage.incdrainexplanationoutlet ?? "",
        "routinedefect1": gidrainage.routinedefect1 ?? "",
        "otherdefect1": gidrainage.otherdefect1 ?? "",
        "routinedefect2": gidrainage.routinedefect2 ?? "",
        "otherdefect2": gidrainage.otherdefect2 ?? "",
        "routinedefect3": gidrainage.routinedefect3 ?? "",
        "otherdefect3": gidrainage.otherdefect3 ?? "",
        "routinedefect4": gidrainage.routinedefect4 ?? "",
        "otherdefect4": gidrainage.otherdefect4 ?? "",
        "routinedefect5": gidrainage.routinedefect5 ?? "",
        "otherdefect5": gidrainage.otherdefect5 ?? "",
      
      },
    );

    debugPrint("API response: ${response.statusCode} ${response.data}");

    if (response.statusCode == 200) {
      await NotificationService.showNotification(
        title: "Success",
        body: "Successfully sent to Principal. Form for ${gidrainage.id ?? ""} has been sent for approval.",
      );

      return AlertDialog(
        title: const Text("Success"),
        content: Text(
          "Form for ${gidrainage.id ?? ""} has been sent for approval on ${DateTime.now()}",
        ),
      );
    } else {
      await NotificationService.showNotification(
        title: "FAIL",
        body: "ERROR OCCURRED",
      );

      return const AlertDialog(
        title: Text("Failed"),
        content: Text("Please check the connection and try again."),
      );
    }
  }
}
