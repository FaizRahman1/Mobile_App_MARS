// File: lib/resources/datasent_repository.dart

import 'package:bridgeinsp_new/slope/slmodels/slopepost_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../notification/services/notification_service.dart';

final Uuid uuid = const Uuid();

abstract class PostingRepository {
  Future<AlertDialog> senddetaillist(SLPostModel slopeInspection);
}

class SLDatasendRepos extends PostingRepository {
  final Dio _dio;

  SLDatasendRepos({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<AlertDialog> senddetaillist(
    SLPostModel slopeInspection,
  ) async {
    debugPrint('Slope repository reachable');

    final String submissionId = uuid.v4();

    try {
      final response = await _dio.post(
        'https://c751d51c-8449-4784-b592-f904983ea9b0.mock.pstmn.io',
        data: {
          // Submission reference
          'submission_id': submissionId,

          // Slope inspection form
          'id': slopeInspection.id,
          'Disk/Film No': slopeInspection.diskfilmno ?? '',
          'Photo No': slopeInspection.photono ?? '',
          'Interface Location': slopeInspection.interfacelocation ?? '',
          'Accessibility': slopeInspection.accessibility ?? '',
          'Accessibility Why': slopeInspection.accessibilitywhy ?? '',
          'Vegetation Control Form':
              slopeInspection.vegetationControlForm ?? '',
          'Vegetation Control Form Description':
              slopeInspection.vegetationControlFormdesc ?? '',
          'Drain Cleaning Form':
              slopeInspection.drainCleaningForm ?? '',
          'Drain Cleaning Form Description':
              slopeInspection.drainCleaningFormdesc ?? '',
          'Gully Repair Form':
              slopeInspection.gullyrepairform ?? '',
          'Gully Repair Form Description':
              slopeInspection.gullyrepairformdesc ?? '',
          'Concrete Restoration Form':
              slopeInspection.concreterestorationform ?? '',
          'Concrete Restoration Form Description':
              slopeInspection.concreterestorationformdesc ?? '',
          'Precast Concrete Replacement Form':
              slopeInspection.precastconcretereplacementform ?? '',
          'Precast Concrete Replacement Form Description':
              slopeInspection.precastconcretereplacementformdesc ?? '',
          'Earth Drain Resectioning Form':
              slopeInspection.earthdrainresectioningform ?? '',
          'Earth Drain Resectioning Form Description':
              slopeInspection.earthdrainresectioningformdesc ?? '',
          'Other Routine Work':
              slopeInspection.otherroutinework ?? '',
          'Status RM': slopeInspection.statusrm ?? '',
          'Date of Inspection':
              slopeInspection.dateofinsp.toIso8601String(),
          'Inspected By': slopeInspection.inspectedby,
          'Maintained By': slopeInspection.maintainedby,

          // General Inspection images from the web/mobile record
          'Images': slopeInspection.images ?? <String>[],
          'Images2': slopeInspection.images2 ?? <String>[],
          'Images3': slopeInspection.images3 ?? <String>[],
          'Images4': slopeInspection.images4 ?? <String>[],
        },
      );

      debugPrint(
        'Slope API response: ${response.statusCode} ${response.data}',
      );

      final statusCode = response.statusCode ?? 0;
      final isSuccessful = statusCode >= 200 && statusCode < 300;

      if (isSuccessful) {
        await NotificationService.showNotification(
          title: 'Success',
          body:
              'Slope form for ${slopeInspection.id} has been sent for approval.',
        );

        return AlertDialog(
          title: const Text('Success'),
          content: Text(
            'Slope form for ${slopeInspection.id} has been sent '
            'for approval on ${DateTime.now()}.',
          ),
        );
      }

      await NotificationService.showNotification(
        title: 'Failed',
        body: 'Unable to send the slope inspection.',
      );

      return AlertDialog(
        title: const Text('Failed'),
        content: Text(
          'The server returned status code $statusCode. '
          'Please check the connection and try again.',
        ),
      );
    } on DioException catch (error) {
      debugPrint(
        'Dio error while sending slope inspection: '
        '${error.response?.statusCode} ${error.message}',
      );

      await NotificationService.showNotification(
        title: 'Failed',
        body: 'Unable to send the slope inspection.',
      );

      return AlertDialog(
        title: const Text('Failed'),
        content: Text(
          error.response?.data?.toString() ??
              error.message ??
              'Please check the connection and try again.',
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('Unexpected slope submission error: $error');
      debugPrintStack(stackTrace: stackTrace);

      await NotificationService.showNotification(
        title: 'Failed',
        body: 'An unexpected error occurred.',
      );

      return const AlertDialog(
        title: Text('Failed'),
        content: Text(
          'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }
}
