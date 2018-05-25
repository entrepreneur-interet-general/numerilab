<!-- import './stylus/main.styl'-->

<template>
  <v-app>    
    <v-navigation-drawer v-model="sideNav" app> 
      <v-list>
        <v-list-tile v-for="item in menuItems" :key="item.title" :to="item.link">
          <!-- <v-list-tile-action>
            <v-icon left>
              {{ item.icon }}
            </v-icon>
          </v-list-tile-action> -->
          <v-list-tile-content>
              {{ item.title }}
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>

    <v-toolbar dark class="purple darken-1" app>
      <v-toolbar-side-icon @click.stop ="sideNav = !sideNav" class="hidden-md-and-up">
        </v-toolbar-side-icon>
      <v-toolbar-title>
         <router-link to="/" tag="span" style="cursor: pointer"> Domen V2 </router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat v-for="item in menuItems" :key="item.title" :to="item.link"> 
          <!-- <v-icon left>
            {{ item.icon }}
          </v-icon> -->
          {{ item.title }}
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>
    <v-content>
      <v-container fluid>
        <router-view/>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      sideNav: false,
      menuItems: [
        { icon: 'supervisor_account', title: 'Accueil', link: '/' },
        { icon: 'room', title: 'Domaines fonctionnels', link: '/domainefonctionnel' },
        { icon: 'person', title: 'Guide', link: '/guide' },
        { icon: 'person', title: 'Profile', link: '/profile' },
        { icon: 'face', title: 'Sign Up', link: '/signup' },
        { icon: 'person', title: 'Sign In', link: '/signin' }
      ]
    }
  },
  name: 'App'
}
</script>
