"use server";

import fs from "fs";
import { join } from "path";
import matter from "gray-matter";
import { exec } from "child_process";
import { MarkdownDocument } from "./types";

const ROOT_PATH = join(process.cwd(), "..");

const RECOMMENDATIONS_PATH = join(
  ROOT_PATH,
  ".vscode/extensions/recommendations"
);

/**
 * `recommendations/` 配下の `.md` による拡張の記述を取得する
 * @url https://github.com/juristr/blog-series-nextjs-nx/blob/main/libs/markdown/src/lib/markdown.ts
 */
export const getMarkdownDocuments = async (): Promise<MarkdownDocument[]> => {
  return new Promise((resolve) => {
    exec(`find ${RECOMMENDATIONS_PATH} -type f`, (_error, stdout) => {
      console.time();

      const documents = stdout
        .split(/\r|\n/g)
        .filter((v) => !!v)
        .map((fullPath) => {
          const path = fullPath.replace(ROOT_PATH, "..");
          const { data, content } = matter(fs.readFileSync(path));
          return {
            frontMatter: data,
            // 複数ファイルを統合して表示するため h1 -> h2 のように 1 レベルずつ下げていく
            content: content.replace(/(?=^|\n)(#+)/mg, "#$1"),
          };
        });
      resolve(documents);

      console.timeEnd();
    });
  });
};
