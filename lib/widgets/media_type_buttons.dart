import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_ratings/providers/media_index.dart';

class MediaTypeButtons extends ConsumerStatefulWidget {
  const MediaTypeButtons({super.key});

  @override
  ConsumerState<MediaTypeButtons> createState() => _MediaTypeButtonsState();
}

class _MediaTypeButtonsState extends ConsumerState<MediaTypeButtons> {
  @override
  Widget build(BuildContext context) {
    final List<String> mediaTypes = ["All", "TV", "Movies"];
    final selectedMediaIndex = ref.watch(mediaIndexProvider);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: mediaTypes.length,
        itemBuilder: (context, index) {
          final isSelected = selectedMediaIndex == index;

          return GestureDetector(
            onTap: () {
              ref.read(mediaIndexProvider.notifier).state = index;
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const .only(right: 5),
              padding: const .symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                borderRadius: .circular(25),
              ),
              child: Center(
                child: Text(
                  mediaTypes[index].toUpperCase(),
                  style: TextStyle(fontWeight: .w600),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
