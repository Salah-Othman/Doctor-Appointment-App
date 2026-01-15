import 'package:doctor_appointment/features/search/data/cubit/search_cubit.dart';
import 'package:doctor_appointment/shared/container_btn.dart';
import 'package:doctor_appointment/features/search/data/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import '../data/cubit/search_state.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Row(
              children: [
                ContainerBtn(
                  child: Center(child: Icon(Icons.arrow_back_ios_new_outlined)),
                ),
                Gap(90),
                CustomText(
                  text: 'Search',
                  color: AppColors.primaryText,
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),

          backgroundColor: AppColors.backgroundColor,
          foregroundColor: AppColors.primaryText,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Gap(32),
              Row(children: [_buildSearchBar(), Gap(8), Icon(Icons.menu)]),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is DoctorSearchInitial) {
                      return _buildInitialState();
                    } else if (state is DoctorSearchLoading) {
                      return _buildLoadingState();
                    } else if (state is DoctorSearchSuccess) {
                      return _buildSuccessState(state.doctors);
                    } else if (state is DoctorSearchEmpty) {
                      return _buildEmptyState(state.searchQuery);
                    } else if (state is DoctorSearchError) {
                      return _buildErrorState(state.message);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 296,
      height: 46,
      color: AppColors.backgroundColor,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(242, 244, 247, 1),
          filled: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromRGBO(158, 158, 158, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(158, 158, 158, 1),
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<SearchCubit>().resetSearch();
                    setState(() {});
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          setState(() {});
          if (value.trim().isNotEmpty) {
            // Add debouncing in production
            context.read<SearchCubit>().searchDoctors(value);
          } else {
            context.read<SearchCubit>().resetSearch();
          }
        },
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.read<SearchCubit>().searchDoctors(value);
          }
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.grey[300]),
          Gap(16),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(8),
          Text(
            'Enter a name to start searching',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primaryText),
          Gap(16),
          Text(
            'Searching...',
            style: TextStyle(fontSize: 16, color: AppColors.primaryText),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(List<SearchModel> doctors) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return _buildDoctorCard(doctors[index]);
      },
    );
  }

  Widget _buildDoctorCard(SearchModel doctor) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: 126,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                doctor.photo!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/home/doctor.png');
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    overFlow: TextOverflow.ellipsis,
                    maxline: 1,
                    text: doctor.name!,
                    color: AppColors.primaryText,
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  Gap(6),
                  Row(
                    children: [
                      CustomText(
                        text: doctor.gender!,
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.secondryColor,
                      ),
                      Gap(8),
                      CustomText(
                        text: '|',
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.secondryColor,
                      ),
                      Gap(8),
                      CustomText(
                        overFlow: TextOverflow.ellipsis,
                        maxline: 1,
                        text: doctor.gender!,
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.secondryColor,
                      ),
                    ],
                  ),
                  Gap(6),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 214, 0, 1),
                        size: 16,
                      ),
                      Gap(4),
                      CustomText(
                        text: '4.8',
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.secondryColor,
                      ),
                      Gap(4),
                      CustomText(
                        text: '(4,279 reviews)',
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.secondryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.teal),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }

  Widget _buildEmptyState(String query) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 100, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No doctors found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No results for "$query"',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 100, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                context.read<SearchCubit>().searchDoctors(
                  _searchController.text,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
