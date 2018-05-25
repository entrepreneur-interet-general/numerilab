<template>
<div id='search'>
  <v-layout>
    <v-flex xs12>
      <v-text-field v-on:keyup="checkKeyUp" solo v-model="searchParams" clearable prepend-icon="search" label="Search"
                    :prepend-icon-cb="search"></v-text-field>
    </v-flex>
  </v-layout>


  <v-layout>
  <v-flex xs12>
   <v-data-table :headers="headers" :items="results">
      <template slot="items" slot-scope="props">
        <td>{{ props.item.colonne }}</td>
        <td>{{ props.item.table }}</td>
        <td>{{ props.item.base }}</td>
        <td>{{ props.item.application }}</td>
      </template>
    </v-data-table>
  </v-flex>
  </v-layout>
</div>
</template>

<script>
import rdata from '@/assets/data.json'

export default {
  methods: {
    search: function () {
      this.headers = rdata['headers']
      this.results = rdata['results']
    },
    clearSearch: function () {
      this.searchParams = ''
    },
    checkKeyUp: function (event) {
      if (event.key === 'Enter') {
        this.search()
      }
    }
  },
  data () {
    return {
      searchParams: '',
      headers: [],
      results: []
    }
  }
}
</script>

