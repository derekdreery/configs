extern crate askama;

use std::path::{PathBuf};

pub enum FileState {
    Bytes(Vec<u8>),
    String(String),
    Disk(PathBuf),
    Template(Box<askama::Template>),
}

pub struct File {
    source: FileState,
    dest: PathBuf,
}

impl File {
    fn new(source: FileState, dest: PathBuf) -> File {
        File { source, dest }
    }
}

pub struct ProvisionBuilder {
    files: Vec<File>
}

impl ProvisionBuilder {
    pub fn add_file(&mut self, source: FileState, dest: PathBuf) {
        self.files.push(File::new(source, dest));
    }
}

impl Default for ProvisionBuilder {
    fn default() -> ProvisionBuilder {
        ProvisionBuilder {
            files: Vec::default()
        }
    }
}

pub struct Provision {
    files: Vec<File>
}

impl Provision {
    pub fn new() -> ProvisionBuilder {
        ProvisionBuilder::default()
    }

    pub fn provision(&self) {
    }
}
