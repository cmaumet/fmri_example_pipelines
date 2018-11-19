bids_dir = fullfile(pwd , '..', 'data', 'ds000114_R2.0.1');
automri_dir = fullfile(pwd , '..', 'output', 'automri');
data_dir = fullfile(automri_dir, 'data');
mkdir_no_warn(data_dir);
gr_dir = fullfile(data_dir, 'gr_control');
mkdir_no_warn(gr_dir);

% Reorganise data according to automri structure
sub_dirs = dir(fullfile(bids_dir, 'sub*'));
for i = 1:numel(sub_dirs)
    bids_sub_dir = fullfile(sub_dirs(i).folder, sub_dirs(i).name);
    
    sub_name = strrep(sub_dirs(i).name, 'sub-', 'su_');
    
    sub_dir = fullfile(gr_dir, sub_name);
    mkdir_no_warn(sub_dir);
    
    func_dir = fullfile(sub_dir, 'functional');
    mkdir_no_warn(func_dir);

    sess_dir = fullfile(func_dir, 'se_fingerfootlips');
    mkdir_no_warn(sess_dir);
    
    copyfile(fullfile(bids_sub_dir, 'ses-test', 'func', ...
                      [sub_dirs(i).name '_ses-test_task-fingerfootlips_bold.nii.gz']),...
             fullfile(sess_dir, 'Fonct_fingerfootlips.nii.gz'));
    
    
    anat_dir = fullfile(sub_dir, 'structural');
    mkdir_no_warn(anat_dir);
    
    copyfile(fullfile(bids_sub_dir, 'ses-test', 'anat', ...
                      [sub_dirs(i).name '_ses-test_T1w.nii.gz']),...
             fullfile(anat_dir, 'T13D_sub.nii.gz'));

end