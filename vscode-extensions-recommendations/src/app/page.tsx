'use client'

import { Remark } from 'react-remark';
import useSWR from 'swr'
import { getMarkdownDocuments } from "./actions"

export default function Home() {
  const { data = [], isLoading } = useSWR('markdown-documents', getMarkdownDocuments)

  return (
    <main>
      <h1>VSCode Extensions</h1>
      <div>
        {isLoading ? 'NOW LOADING' : data.map((markdownDocument, markdownDocumentIndex) => (
          <div key={markdownDocumentIndex} className="mb-10">
            <Remark>{markdownDocument.content}</Remark>
          </div>
        ))}
      </div>
    </main>
  )
}
